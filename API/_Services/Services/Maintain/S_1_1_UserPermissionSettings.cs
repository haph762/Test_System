using AgileObjects.AgileMapper;
using API._Repositories;
using API._Services.Interfaces.Maintain;
using API.DTOs.Commons;
using API.DTOs.Maintain.UserPermissionSettings;
using API.Models;
using LinqKit;
using Microsoft.EntityFrameworkCore;
using SD3_API.Helpers.Utilities;

namespace API._Services.Services.Maintain
{
    public class S_1_1_UserPermissionSettings : I_1_1_UserPermissionSettings
    {
        private readonly IRepositoryAccessor _repoAccessor;
        
        public S_1_1_UserPermissionSettings(IRepositoryAccessor repoAccessor) {
            _repoAccessor = repoAccessor;
        }

        public async Task<bool> AddUser(UsersDto model)
        {
            var userFind = await _repoAccessor.Users.FindSingle(x => x.account.Trim() == model.account);
            if(userFind != null) {
                return false;
            } else {
                model.update_time = DateTime.Now;
                var user = Mapper.Map(model).ToANew<Users>(x => x.MapEntityKeys());
                _repoAccessor.Users.Add(user);
                return await _repoAccessor.Save();
            }
        }

        public async Task<bool> EditUser(UsersDto model)
        {
            model.update_time = DateTime.Now;
            var user = Mapper.Map(model).ToANew<Users>(x => x.MapEntityKeys());
            _repoAccessor.Users.Update(user);
            return await _repoAccessor.Save();
        }

        public async Task<PaginationUtility<Users>> GetDataUsers(PaginationParam pagination, string account, string is_active)
        {
            var predicateUser = PredicateBuilder.New<Users>(true);

            if(!string.IsNullOrEmpty(account)) {
                predicateUser.And(x => x.account.ToLower().Trim().Contains(account.ToLower()));
            }
            if(is_active != "all") {
                predicateUser.And(x => x.is_active == (is_active == "1" ? true : false));
            }
            var data = _repoAccessor.Users.FindAll(predicateUser);
            return await PaginationUtility<Users>.CreateAsync(data, pagination.PageNumber, pagination.PageSize, true);
        }

        public async Task<List<RolesUserStatus>> GetRoleUser(string account)
        {
            var roles = _repoAccessor.Roles.FindAll();
            var userRoles = _repoAccessor.RoleUser.FindAll(x => x.user_account.Trim() == account.Trim());
            var result = await roles.GroupJoin(
                userRoles,
                x => x.role_unique,
                y => y.role_unique,
                (x,y) => new {roles = x, userRoles = y}
            ).SelectMany(
                x => x.userRoles.DefaultIfEmpty(),
                (x,y) => new {roles = x.roles, userRoles = y}
            ).Select(x => new RolesUserStatus() {
                user_account = account,
                role_name = x.roles.role_name,
                role_unique = x.roles.role_unique,
                role_sequence = x.roles.role_sequence,
                status = x.userRoles != null ? true : false
            }).OrderBy(x => x.role_sequence).ToListAsync();
            return result;
        }

        public async Task<bool> UpdateRolesUser(List<RolesUserStatus> roles, string updateBy)
        {
             var user_account = roles[0].user_account.Trim();
            var rolesUserCurrent = await _repoAccessor.RoleUser.FindAll(x => x.user_account.Trim() == user_account).ToListAsync();

            foreach (var author in roles)
            {
                var timeNow = DateTime.Now;
                var roleFind = rolesUserCurrent.FirstOrDefault(x => x.role_unique.Trim() == author.role_unique.Trim());

                // role đc check
                if(author.status) {
                    
                    if(roleFind == null) {
                        // role đc check nhưng trong DB chưa có => add data
                        var roleUserAdd = Mapper.Map(author).ToANew<RoleUser>(x => x.MapEntityKeys());
                        roleUserAdd.create_by = updateBy;
                        roleUserAdd.create_time = timeNow;
                        _repoAccessor.RoleUser.Add(roleUserAdd);
                    }
                }
                // role không đc check
                else {
                    if(roleFind != null) {
                        // role không đc check và có trong DB => remove data
                         _repoAccessor.RoleUser.Remove(roleFind);
                    }
                }
                
            }
            return await _repoAccessor.Save();
        }
    }
}