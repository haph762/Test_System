using AgileObjects.AgileMapper.Configuration;
using API.Dtos.Auth;
using API.Models;

namespace API.Helper.Mappers
{
    public class MapperConfig : MapperConfiguration
    {
        protected override void Configure()
        {
            WhenMapping.From<Roles>().To<RoleInfomation>()
                .Map((f,t) => f.role_name).To(t => t.Name).And
                .Map((f,t) => f.role_unique).To(t => t.Unique).And
                .Map((f,t) => f.role_sequence).To(t => t.Position);
        }
    }
}