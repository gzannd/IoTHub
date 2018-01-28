using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Common.Implementation.Logging;
using Common.Implementation.Service;
using Common.Implementation.User;
using Common.Interfaces.Logging;
using Common.Interfaces.User;
using Common.Interfaces.Validator;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using UnitTests.Mocks.User;

namespace IoTHub
{
    public class Startup
    {
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddMvc();

            var builder = new ConfigurationBuilder()
            .SetBasePath(Directory.GetCurrentDirectory())
            .AddJsonFile("appsettings.json");

            var Configuration = builder.Build();

            services.Configure<AppSettings>(Configuration.GetSection("BALSettings"));
            services.AddScoped<IUserService, UserService>();
            services.AddScoped<IUserRepository, MockUserRepository>(r => new MockUserRepository(new List<IUser> { new UserDTO { Id = 1, Email = "test@test.com", FirstName = "Test", LastName = "User", IsActive = true } }));
            services.AddScoped<IValidator<IUser>, UserValidator>();

            services.AddScoped<Common.Interfaces.Logging.ILogger, NullLogger>();

            // 1. Add Authentication Services
            services.AddAuthentication(options =>
            {
                options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;

            }).AddJwtBearer(options =>
            {
                options.Authority = "https://iothub.auth0.com/";
                options.Audience = "iothub";
            });
        }


        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
            }


            app.UseStaticFiles();

            // 2. Enable authentication middleware
            app.UseAuthentication();

            app.UseMvc(routes =>
            {
                routes.MapRoute(
                    name: "default",
                    template: "{controller=Home}/{action=Index}/{id?}");
            });
        }
    }
}
