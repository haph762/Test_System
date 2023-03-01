using API._Services.Interfaces.Transaction;
using Microsoft.AspNetCore.Mvc;
using SD3_API.Helpers.Utilities;

namespace API.Controllers.Transaction
{
    public class C_2_6_EDITransactionController : APIController
    {
        private readonly I_2_6_EDITransaction _fDITransaction;
        private readonly IFunctionUtility _functionUtility;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public C_2_6_EDITransactionController(I_2_6_EDITransaction fDITransaction, IFunctionUtility functionUtility, IWebHostEnvironment webHostEnvironment)
        {
            _fDITransaction = fDITransaction;
            _functionUtility = functionUtility;
            _webHostEnvironment = webHostEnvironment;
        }

        [HttpPost("ImportExcel")]
        public async Task<IActionResult> ImportExcel([FromForm] IFormFile file)
        {
            var folder = "uploaded/excels/Transaction/FDITransaction";
            string fileName = await _functionUtility.UploadAsync(file, folder, "FDITransaction");
            var filePath = Path.Combine(_webHostEnvironment.WebRootPath, folder, fileName);

            string user = userName;
            var data = await _fDITransaction.ImportExcel(filePath, user);
            return Ok(data);
        }
        [HttpGet("ExportExcel")]
        public async Task<IActionResult> ExportExcel([FromQuery] string startDate, [FromQuery] string endDate)
        {
            var result = await _fDITransaction.ExportExcel(startDate, endDate);
            return File(result, "application/xlsx", "FDITransaction" + DateTime.Now.ToString("dd_MM_yyyy") + ".xlsx");
        }
    }
}