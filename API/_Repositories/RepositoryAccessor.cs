
using API._Repositories.Interfaces;
using API._Repositories.Repositories;
using API.Data;
using Microsoft.EntityFrameworkCore.Storage;

namespace API._Repositories
{
    public class RepositoryAccessor : IRepositoryAccessor
    {
        private DBContext _dbContext;
        public RepositoryAccessor(DBContext dbContext)
        {
            _dbContext = dbContext;
            M_CUSTOMS_MATERIAL = new M_CUSTOMS_MATERIAL_Repository(_dbContext);
            Roles = new Roles_Repository(_dbContext);
            T_EDI_INBOUND = new T_EDI_INBOUND_Repository(_dbContext);
            Users = new User_Repository(_dbContext);
            RoleUser = new RoleUser_Repository(_dbContext);
        }

        public IM_CUSTOMS_MATERIAL_Repository M_CUSTOMS_MATERIAL { get; set; }
        public IRoles_Repository Roles { get; set; }
        public IT_EDI_INBOUND_Repository T_EDI_INBOUND { get; set; }
        public IUsers_Repository Users { get; set; }
        public IRoleUser_Repository RoleUser { get; set; }

        public async Task<bool> Save()
        {
            return await _dbContext.SaveChangesAsync() > 0;
        }

        public async Task<IDbContextTransaction> BeginTransactionAsync()
        {
            return await _dbContext.Database.BeginTransactionAsync();
        }
    }
}