using System.ComponentModel.DataAnnotations;
using AgileObjects.AgileMapper;
using API._Repositories;
using API._Services.Interfaces.Transaction;
using API.DTOs.Transaction.EDITransaction;
using API.Helpers.Utilities;
using API.Models;
using Aspose.Cells;
using LinqKit;
using Microsoft.EntityFrameworkCore;
using SD3_API.Helpers.Utilities;

namespace API._Services.Services.Transaction
{
    public class S_2_6_EDITransaction : I_2_6_EDITransaction
    {
        private readonly IRepositoryAccessor _repository;
        private readonly IConfiguration _configuration;
        protected readonly string _factory;

        public S_2_6_EDITransaction(IRepositoryAccessor repository, IConfiguration configuration)
        {
            _repository = repository;
            _configuration = configuration;
            _factory = _configuration.GetSection("Appsettings:Factory_Code").Value;
        }

        public async Task<OperationResult> ImportExcel(string filePath, string user)
        {
            var transaction = await _repository.BeginTransactionAsync();
            List<T_EDI_INBOUND> listAdd = new List<T_EDI_INBOUND>();
            List<T_EDI_INBOUND> listUpdate = new List<T_EDI_INBOUND>();
            List<T_EDI_INBOUND> listRemove = new List<T_EDI_INBOUND>();
            string ErrorMsg = "";
            WorkbookDesigner designer = new WorkbookDesigner();
            designer.Workbook = new Workbook(filePath);
            Worksheet ws = designer.Workbook.Worksheets[0];

            int totalRows = ws.Cells.MaxDataRow;
            if (totalRows < 1)
            {
                await transaction.RollbackAsync();
                return new OperationResult { IsSuccess = false, Error = "No Data" };
            }

            for (int i = 1; i <= totalRows; i++)
            {

                // check duplicates
                for (int j = i + 1; j <= totalRows; j++)
                {
                    if (ws.Cells[i, 0].Value?.ToString().Trim() == ws.Cells[j, 0].Value?.ToString().Trim() &&
                        ws.Cells[i, 19].Value?.ToString().Trim() == ws.Cells[j, 19].Value?.ToString().Trim() &&
                        ws.Cells[i, 9].Value?.ToString().Trim() == ws.Cells[j, 9].Value?.ToString().Trim())
                    {
                        int rowI = i + 1;
                        int rowJ = j + 1;
                        ErrorMsg += " Row " + rowI + " and " + rowJ + " are duplicates; ";
                        await transaction.RollbackAsync();
                        return new OperationResult { IsSuccess = false, Error = ErrorMsg };
                    }
                }

                EDITransactionDto obj = new EDITransactionDto();
                int row = i + 1;
                var Supplier_Code = ws.Cells[i, 0].Value?.ToString().Trim();
                var Invoice = ws.Cells[i, 19].Value?.ToString().Trim();
                var CMatl_Code = ws.Cells[i, 9].Value?.ToString().Trim();
                var state = ws.Cells[i, 22].Value?.ToString().Trim().ToUpper();

                var dataCheck = await _repository.T_EDI_INBOUND.FindAll(x =>
                    x.Supplier_Code == Supplier_Code && x.Invoice == Invoice && x.CMatl_Code == CMatl_Code && x.Factory == _factory)
                    .AsNoTracking().FirstOrDefaultAsync();

                //check column sate and database
                if (state == "A" && dataCheck != null)
                {
                    ErrorMsg += " Row " + row + " already exists; ";
                    await transaction.RollbackAsync();
                    return new OperationResult { IsSuccess = false, Error = ErrorMsg };
                }
                else if (state == "A" && dataCheck == null)
                {
                    obj.Insert_By = user;
                    obj.Insert_At = DateTime.Now;
                }
                else if (state == "U" && dataCheck != null)
                {
                    obj.Insert_At = dataCheck.Insert_At;
                    obj.Insert_By = dataCheck.Insert_By;
                    obj.Update_By = user;
                    obj.Update_At = DateTime.Now;
                }
                else if (state == "U" && dataCheck == null)
                {
                    ErrorMsg += " Row " + row + " is can't update; ";
                    await transaction.RollbackAsync();
                    return new OperationResult { IsSuccess = false, Error = ErrorMsg };
                }
                else if (state == "D" && dataCheck != null)
                {
                    listRemove.Add(dataCheck);
                }
                else if (state == "D" && dataCheck == null)
                {

                    ErrorMsg += " Row " + row + " is can't delete; ";
                    await transaction.RollbackAsync();
                    return new OperationResult { IsSuccess = false, Error = ErrorMsg };
                }
                else
                {
                    ErrorMsg += " Row " + row + " column state is blank or is invalid; ";
                    await transaction.RollbackAsync();
                    return new OperationResult { IsSuccess = false, Error = ErrorMsg };
                }

                try
                {
                    if (state == "A" || state == "U")
                    {

                        obj.Factory = _factory;
                        obj.Supplier_Code = Supplier_Code;
                        obj.Supplier_Declare_No = ws.Cells[i, 1].Value?.ToString().Trim();
                        obj.Batch_No = ws.Cells[i, 2].Value?.ToString().Trim();
                        obj.Con_Type = ws.Cells[i, 3].Value?.ToString().Trim();
                        obj.Declare_No = ws.Cells[i, 4].Value?.ToString().Trim();
                        obj.Declare_Date = ws.Cells[i, 5].Value?.ToString().Trim() != null ? DateTime.Parse(ws.Cells[i, 5].Value?.ToString().Trim()) : null;
                        obj.Declare_Type = ws.Cells[i, 6].Value?.ToString().Trim();
                        obj.Unloading_Location = ws.Cells[i, 7].Value?.ToString().Trim();
                        obj.Terms_Of_Trade = ws.Cells[i, 8].Value?.ToString().Trim();
                        obj.CMatl_Code = CMatl_Code;
                        // Customs Material Name Don't save to database. Cells[i, 10]
                        obj.HS_Code = ws.Cells[i, 11].Value?.ToString().Trim();
                        obj.Declare_Quantity = Convert.ToDecimal(ws.Cells[i, 12].Value?.ToString().Trim());
                        obj.Declare_Unit_Price = Convert.ToDecimal(ws.Cells[i, 13].Value?.ToString().Trim());
                        obj.Amount_USD = Convert.ToDecimal(ws.Cells[i, 14].Value?.ToString().Trim());
                        obj.Amount_VND = Convert.ToDecimal(ws.Cells[i, 15].Value?.ToString().Trim());
                        obj.CMatl_Unit = ws.Cells[i, 16].Value?.ToString().Trim();
                        obj.Insur_Fee = Convert.ToDecimal(ws.Cells[i, 17].Value?.ToString().Trim());
                        obj.Trans_Fee = Convert.ToDecimal(ws.Cells[i, 18].Value?.ToString().Trim());
                        obj.Invoice = Invoice;
                        obj.Invoice_Date = DateTime.Parse(ws.Cells[i, 20].Value?.ToString().Trim());
                        obj.Con_No = ws.Cells[i, 21].Value?.ToString().Trim();

                        //check data by DataAnnotations
                        ValidationContext context = new ValidationContext(obj, null, null);
                        List<ValidationResult> results = new List<ValidationResult>();
                        bool valid = Validator.TryValidateObject(obj, context, results, true);

                        if (!valid)
                        {
                            ErrorMsg += "Row " + row + ": ";
                            foreach (ValidationResult vr in results)
                            {
                                ErrorMsg += vr.ErrorMessage + "; ";
                            }
                            await transaction.RollbackAsync();
                            return new OperationResult { IsSuccess = false, Error = ErrorMsg };
                        }
                    }

                    switch (state)
                    {
                        case "A":
                            listAdd.Add(Mapper.Map(obj).ToANew<T_EDI_INBOUND>(x => x.MapEntityKeys()));
                            break;
                        case "U":
                            listUpdate.Add(Mapper.Map(obj).ToANew<T_EDI_INBOUND>(x => x.MapEntityKeys()));
                            break;
                        default:
                            break;
                    }
                }
                catch (System.Exception)
                {

                    ErrorMsg += " Row " + row + " invalid data; ";
                    await transaction.RollbackAsync();
                    return new OperationResult { IsSuccess = false, Error = ErrorMsg };
                }
            }

            _repository.T_EDI_INBOUND.AddMultiple(listAdd);
            _repository.T_EDI_INBOUND.UpdateMultiple(listUpdate);
            _repository.T_EDI_INBOUND.RemoveMultiple(listRemove);

            await _repository.Save();
            await transaction.CommitAsync();
            return new OperationResult { IsSuccess = true };
        }

        public async Task<byte[]> ExportExcel(string startDate, string endDate)
        {
            // get data
            var predT_EDI_INBOUND = PredicateBuilder.New<T_EDI_INBOUND>(true);
            if (!string.IsNullOrWhiteSpace(startDate))
            {
                var startTime = Convert.ToDateTime(startDate + " 00:00:00.000");

                predT_EDI_INBOUND.And(x => x.Declare_Date >= startTime);
            }
            if (!string.IsNullOrWhiteSpace(endDate))
            {
                var endTime = Convert.ToDateTime(endDate + " 00:00:00.000");

                predT_EDI_INBOUND.And(x => x.Declare_Date <= endTime);
            }
            var Data_T_EDI_INBOUND = await _repository.T_EDI_INBOUND.FindAll(predT_EDI_INBOUND).ToListAsync();
            var Data_M_CUSTOMS_MATERIAL = await _repository.M_CUSTOMS_MATERIAL.FindAll().ToListAsync();

            var result = Data_T_EDI_INBOUND.GroupJoin(Data_M_CUSTOMS_MATERIAL,
                x => new { x.Factory, x.CMatl_Code },
                y => new { y.Factory, y.CMatl_Code },
                (x, y) => new { left = x, right = y }
            ).SelectMany(x => x.right.DefaultIfEmpty(), (x, y) => new { left = x.left, right = y })
            .Select(x => new EDITransactionDto()
            {
                Supplier_Code = x.left.Supplier_Code,
                Supplier_Declare_No = x.left.Supplier_Declare_No,
                Batch_No = x.left.Batch_No,
                Con_Type = x.left.Con_Type,
                Declare_No = x.left.Declare_No,
                Declare_Date = x.left.Declare_Date,
                Declare_Type = x.left.Declare_Type,
                Unloading_Location = x.left.Unloading_Location,
                Terms_Of_Trade = x.left.Terms_Of_Trade,
                CMatl_Code = x.left.CMatl_Code,
                CMatl_Name = x.right?.CMatl_Name,
                HS_Code = x.left.HS_Code,
                Declare_Quantity = x.left.Declare_Quantity,
                Declare_Unit_Price = x.left.Declare_Unit_Price,
                Amount_USD = x.left.Amount_USD,
                Amount_VND = x.left.Amount_VND,
                CMatl_Unit = x.left.CMatl_Unit,
                Insur_Fee = x.left.Insur_Fee,
                Trans_Fee = x.left.Trans_Fee,
                Invoice = x.left.Invoice,
                Invoice_Date = x.left.Invoice_Date,
                Con_No = x.left.Con_No,
            }).ToList();

            // export excel
            var path = Path.Combine(Directory.GetCurrentDirectory(), @"Resources\Template\Transactions\EDITransaction\EDITransaction.xlsx");
            var designer = new WorkbookDesigner();
            designer.Workbook = new Workbook(path);
            var ws = designer.Workbook.Worksheets[0];
            var index = 3;

            foreach (var i in result)
            {

                ws.Cells[index, 0].PutValue(i.Supplier_Code);
                ws.Cells[index, 1].PutValue(i.Supplier_Declare_No);
                ws.Cells[index, 2].PutValue(i.Batch_No);
                ws.Cells[index, 3].PutValue(i.Con_Type);
                ws.Cells[index, 4].PutValue(i.Declare_No);
                ws.Cells[index, 5].PutValue(i.Declare_Date?.ToString("MM/dd/yyyy"));
                ws.Cells[index, 6].PutValue(i.Declare_Type);
                ws.Cells[index, 7].PutValue(i.Unloading_Location);
                ws.Cells[index, 8].PutValue(i.Terms_Of_Trade);
                ws.Cells[index, 9].PutValue(i.CMatl_Code);
                ws.Cells[index, 10].PutValue(i.CMatl_Name);
                ws.Cells[index, 11].PutValue(i.HS_Code);
                ws.Cells[index, 12].PutValue(i.Declare_Quantity.ToString("F"));
                ws.Cells[index, 13].PutValue(i.Declare_Unit_Price.ToString("F"));
                ws.Cells[index, 14].PutValue(i.Amount_USD.ToString("F"));
                ws.Cells[index, 15].PutValue(i.Amount_VND.ToString("F"));
                ws.Cells[index, 16].PutValue(i.CMatl_Unit);
                ws.Cells[index, 17].PutValue(i.Insur_Fee.ToString("F"));
                ws.Cells[index, 18].PutValue(i.Trans_Fee.ToString("F"));
                ws.Cells[index, 19].PutValue(i.Invoice);
                ws.Cells[index, 20].PutValue(i.Invoice_Date.ToString("MM/dd/yyyy"));
                ws.Cells[index, 21].PutValue(i.Con_No);
                index++;
            }
            ws.Cells.StandardWidth = 30.5;
            ws.Cells.StandardHeight = 20.5;
            ws.AutoFitColumns();

            MemoryStream stream = new MemoryStream();
            if (result.Count > 0)
            {
                Style style = designer.Workbook.CreateStyle();
                ws.Cells.CreateRange(3, 0, result.Count, 23).SetStyle(AsposeUtility.SetAllBorders(style));
                designer.Workbook.Save(stream, SaveFormat.Xlsx);
            }
            byte[] resultExcel = stream.ToArray();

            return resultExcel;
        }
    }
}