using API._Repositories.Interfaces;
using API.Data;
using API.Models;

namespace API._Repositories.Repositories
{
    public class M_CUSTOMS_MATERIAL_Repository : Repository<M_CUSTOMS_MATERIAL>, IM_CUSTOMS_MATERIAL_Repository
    {
        private DBContext _context;
        public M_CUSTOMS_MATERIAL_Repository(DBContext context) : base(context)
        {
            _context = context;
        }
    }
}