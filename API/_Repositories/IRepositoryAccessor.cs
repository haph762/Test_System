
using API._Repositories.Interfaces;
using Microsoft.EntityFrameworkCore.Storage;

namespace API._Repositories
{
    public interface IRepositoryAccessor
    {
        IM_CUSTOMS_MATERIAL_Repository M_CUSTOMS_MATERIAL { get; }
        IRoles_Repository Roles { get; }
        IT_EDI_INBOUND_Repository T_EDI_INBOUND { get; }
        IUsers_Repository Users { get; }
        IRoleUser_Repository RoleUser { get; }
        Task<bool> Save();
        Task<IDbContextTransaction> BeginTransactionAsync();
    }
}