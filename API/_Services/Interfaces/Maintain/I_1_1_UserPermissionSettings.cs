using API.DTOs.Commons;
using API.DTOs.Maintain.UserPermissionSettings;
using API.Models;
using SD3_API.Helpers.Utilities;

namespace API._Services.Interfaces.Maintain
{
    public interface I_1_1_UserPermissionSettings
    {
        Task<PaginationUtility<Users>> GetDataUsers(PaginationParam pagination, string account, string is_active);
        Task<bool> AddUser(UsersDto model);
        Task<bool> EditUser(UsersDto model);
        Task<List<RolesUserStatus>> GetRoleUser(string account);
        Task<bool> UpdateRolesUser(List<RolesUserStatus> roles, string updateBy);
    }
}