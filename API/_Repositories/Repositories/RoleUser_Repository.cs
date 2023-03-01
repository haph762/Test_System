using API._Repositories.Interfaces;
using API.Data;
using API.Models;

namespace API._Repositories.Repositories
{
    public class RoleUser_Repository : Repository<RoleUser>, IRoleUser_Repository
    {
        private DBContext _context;
        public RoleUser_Repository(DBContext context) : base(context)
        {
            _context = context;
        }
    }
}