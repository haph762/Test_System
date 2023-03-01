

using API._Repositories;
using API._Services.Interfaces;
using API._Services.Interfaces.Transaction;
using API._Services.Services;
using API._Services.Services.Transaction;
using SD3_API.Helpers.Utilities;
using API._Services.Interfaces.Maintain;
using API._Services.Services.Maintain;

namespace API.Configurations
{
    public static class DependencyInjectionConfig
    {
        public static void AddDependencyInjectionConfiguration(this IServiceCollection services)
        {
            if (services == null) throw new ArgumentNullException(nameof(services));

            // Add RepositoryAccessor
            services.AddScoped<IRepositoryAccessor, RepositoryAccessor>();

            // Add Service
            services.AddScoped<I_Auth, S_Auth>();
            services.AddScoped<IFunctionUtility, FunctionUtility>();
            services.AddScoped<I_2_6_EDITransaction, S_2_6_EDITransaction>();
            services.AddScoped<I_1_1_UserPermissionSettings, S_1_1_UserPermissionSettings>();
        }
    }
}