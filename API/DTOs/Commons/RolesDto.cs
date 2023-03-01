

namespace API.Dtos.Commons
{
    public class RolesDto
    {
        public string role_unique { get; set; }
        public string role_name { get; set; }
        public string role_type { get; set; }
        public string role_note { get; set; }
        public double role_sequence { get; set; }
        public string update_by { get; set; }
        public DateTime update_time { get; set; }
    }
}
