

namespace API.Dtos.Commons
{
    public class T_EDI_INBOUNDDto
    {
        public string Factory { get; set; }
        public string Supplier_Code { get; set; }
        public string Invoice { get; set; }
        public string CMatl_Code { get; set; }
        public string Declare_No { get; set; }
        public string Declare_Type { get; set; }
        public DateTime? Declare_Date { get; set; }
        public string Unloading_Location { get; set; }
        public string Terms_Of_Trade { get; set; }
        public string HS_Code { get; set; }
        public string CMatl_Unit { get; set; }
        public string Supplier_Declare_No { get; set; }
        public string Con_No { get; set; }
        public string Con_Type { get; set; }
        public string Batch_No { get; set; }
        public decimal Declare_Quantity { get; set; }
        public decimal Declare_Unit_Price { get; set; }
        public decimal Amount_USD { get; set; }
        public decimal Amount_VND { get; set; }
        public decimal Insur_Fee { get; set; }
        public decimal Trans_Fee { get; set; }
        public DateTime Invoice_Date { get; set; }
        public string Close_State { get; set; }
        public string Insert_By { get; set; }
        public DateTime Insert_At { get; set; }
        public string Update_By { get; set; }
        public DateTime? Update_At { get; set; }
    }
}
