using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace API.DTOs.Transaction.EDITransaction
{
    public class EDITransactionDto
    {
        [Key]
        [StringLength(4, ErrorMessage = "Factory must be a string with a maximum length of 4")]
        public string Factory { get; set; }

        [Key]
        [StringLength(10, ErrorMessage = "Supplier Code must be a string with a maximum length of 10")]
        public string Supplier_Code { get; set; }

        [Key]
        [StringLength(20, ErrorMessage = "Invoice must be a string with a maximum length of 20")]
        public string Invoice { get; set; }

        [Key]
        [StringLength(10, ErrorMessage = "Customs Material must be a string with a maximum length of 10")]
        public string CMatl_Code { get; set; }

        [StringLength(35, ErrorMessage = "Declare No must be a string with a maximum length of 35")]
        public string Declare_No { get; set; }

        [StringLength(3, ErrorMessage = "Declare Type must be a string with a maximum length of 3")]
        public string Declare_Type { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Declare_Date { get; set; }

        [Required(ErrorMessage = "Unloading Location is required")]
        [StringLength(200, ErrorMessage = "Unloading Location must be a string with a maximum length of 200")]
        public string Unloading_Location { get; set; }

        [Required(ErrorMessage = "Terms Of Trade is required")]
        [StringLength(5, ErrorMessage = "Terms Of Trade must be a string with a maximum length of 5")]
        public string Terms_Of_Trade { get; set; }

        [Required(ErrorMessage = "HS Code is required")]
        [StringLength(15, ErrorMessage = "HS Code must be a string with a maximum length of 15")]
        public string HS_Code { get; set; }

        [Required(ErrorMessage = "Customs Material Unit is required")]
        [StringLength(20, ErrorMessage = "Customs Material Unit must be a string with a maximum length of 20")]
        public string CMatl_Unit { get; set; }

        [StringLength(12, ErrorMessage = "Supplier Declare must be a string with a maximum length of 12")]
        public string Supplier_Declare_No { get; set; }

        [StringLength(20, ErrorMessage = "Contract must be a string with a maximum length of 20")]
        public string Con_No { get; set; }

        [StringLength(1, ErrorMessage = "Contract Type must be a string with a maximum length of 1")]
        public string Con_Type { get; set; }

        [StringLength(10, ErrorMessage = "Batch No must be a string with a maximum length of 10")]
        public string Batch_No { get; set; }

        [Column(TypeName = "decimal(13, 2)")]
        public decimal Declare_Quantity { get; set; }
        [Column(TypeName = "decimal(11, 2)")]
        public decimal Declare_Unit_Price { get; set; }
        [Column(TypeName = "decimal(13, 2)")]
        public decimal Amount_USD { get; set; }
        [Column(TypeName = "decimal(13, 2)")]
        public decimal Amount_VND { get; set; }
        [Column(TypeName = "decimal(13, 2)")]
        public decimal Insur_Fee { get; set; }
        [Column(TypeName = "decimal(13, 2)")]
        public decimal Trans_Fee { get; set; }
        [Column(TypeName = "date")]
        public DateTime Invoice_Date { get; set; }
        [StringLength(1)]
        public string Close_State { get; set; }
        [Required]
        [StringLength(10)]
        public string Insert_By { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime Insert_At { get; set; }
        [StringLength(10)]
        public string Update_By { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime? Update_At { get; set; }
        public string CMatl_Name { get; set; }
    }
}