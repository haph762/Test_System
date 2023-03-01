using API._Services.Interfaces.Maintain;
using API.DTOs.Commons;
using API.DTOs.Maintain.UserPermissionSettings;
using Microsoft.AspNetCore.Mvc;
using SD3_API.Helpers.Utilities;

namespace API.Controllers.Maintain
{
    public class C_1_1_UserPermissionSettingsController : APIController
    {
        private readonly I_1_1_UserPermissionSettings _service;
        public C_1_1_UserPermissionSettingsController(I_1_1_UserPermissionSettings service) {
            _service = service;
        }

        [HttpGet("getDataUsers")]
        public async Task<IActionResult> GetDataUsers([FromQuery]PaginationParam pagination, string account, string is_active) {
            var data = await _service.GetDataUsers(pagination, account, is_active);
            return Ok(data);
        }

        [HttpPost("addUser")]
        public async Task<IActionResult> AddUser(UsersDto model) {
            model.update_by = userName;
            var result = await _service.AddUser(model);
            return Ok(true);
        }

        [HttpPut("editUser")]
        public async Task<IActionResult> EditUser(UsersDto model) {
            model.update_by = userName;
            var result = await _service.EditUser(model);
            return Ok(result);
        }

        [HttpGet("getRoleUser")]
        public async Task<IActionResult> GetRoleUser(string account) {
            var data = await _service.GetRoleUser(account);
            return Ok(data);
        }
        
        [HttpPost("updateRolesUser")]
        public async Task<IActionResult> UpdateRolesUser(List<RolesUserStatus> authors) {
            var data = await _service.UpdateRolesUser(authors, userName);
            return Ok(data);
        }
    }
}