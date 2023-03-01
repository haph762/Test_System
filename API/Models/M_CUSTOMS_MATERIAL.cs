
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace API.Models
{
    public partial class M_CUSTOMS_MATERIAL
    {
        [Key]
        [StringLength(4)]
        public string Factory { get; set; }
        [Key]
        [StringLength(10)]
        public string CMatl_Code { get; set; }
        [Required]
        [StringLength(200)]
        public string CMatl_Name { get; set; }
        [Required]
        [StringLength(20)]
        public string CMatl_Unit { get; set; }
        [Required]
        [StringLength(15)]
        public string HS_Code { get; set; }
        [Required]
        [StringLength(10)]
        public string Insert_By { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime Insert_At { get; set; }
        [StringLength(10)]
        public string Update_By { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime? Update_At { get; set; }
    }
}
