using SD3_API.Helpers.Utilities;

namespace API._Services.Interfaces.Transaction
{
    public interface I_2_6_EDITransaction
    {
        Task<OperationResult> ImportExcel(string filePath, string user);
        Task<byte[]> ExportExcel(string startDate, string endDate);

    }
}