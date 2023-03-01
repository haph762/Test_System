using API.Models;
using Microsoft.EntityFrameworkCore;

namespace API.Data
{
    public partial class DBContext : DbContext
    {
        public DBContext()
        {
        }

        public DBContext(DbContextOptions<DBContext> options) : base(options)
        {

            Database.SetCommandTimeout((int)TimeSpan.FromMinutes(10).TotalSeconds);
        }
        public virtual DbSet<M_CUSTOMS_MATERIAL> M_CUSTOMS_MATERIAL { get; set; }
        public virtual DbSet<Roles> Roles { get; set; }
        public virtual DbSet<T_EDI_INBOUND> T_EDI_INBOUND { get; set; }
        public virtual DbSet<Users> Users { get; set; }
        public virtual DbSet<RoleUser> RoleUser { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

            modelBuilder.Entity<M_CUSTOMS_MATERIAL>(entity =>
            {
                entity.HasKey(e => new { e.Factory, e.CMatl_Code });
            });

            modelBuilder.Entity<T_EDI_INBOUND>(entity =>
            {
                entity.HasKey(e => new { e.Factory, e.Supplier_Code, e.Invoice, e.CMatl_Code });
            });

            modelBuilder.Entity<RoleUser>(entity =>
            {
                entity.HasKey(e => new { e.user_account, e.role_unique });
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}