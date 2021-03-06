﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Common.Implementation.Logging;
using Common.Implementation.Service;
using Common.Implementation.User;
using Common.Interfaces.Logging;
using Common.Interfaces.Repository;
using Common.Interfaces.User;
using Common.Interfaces.Validator;
using System.Configuration;
using DataAccess.Connection;
using DataAccess.Dapper.User;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Common.Interfaces.Account;
using Common.Implementation.Account;
using DataAccess.Dapper.Account;
using Common.Implementation.UserAccount;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Cors.Internal;
using Microsoft.AspNetCore.Authentication.Cookies;
using DataAccess;
using Common.Implementation;
using Microsoft.AspNetCore.Identity;
using Common;

namespace IoTHub
{
    public class Startup
    {
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddMvc();
            services.AddCors();

            var builder = new ConfigurationBuilder()
            .SetBasePath(Directory.GetCurrentDirectory())
            .AddJsonFile("appsettings.json");

            var ConfigurationManager = builder.Build();

            services.Configure<AppSettings>(ConfigurationManager.GetSection("BALSettings"));

            services.AddScoped<IValidator<IUser>, UserValidator>();
            services.AddScoped<IValidator<IAccount>, AccountValidator>();

            services.AddScoped<IUserService, UserService>();
            services.AddScoped<IAccountService, AccountService>();
            services.AddScoped<UserAccountService>();
            services.AddScoped<IConnectionFactory, ConnectionFactory>(c => new ConnectionFactory(ConfigurationManager.GetConnectionString("DBConnectionString")));

            services.AddScoped<Microsoft.AspNetCore.Identity.IUserStore<IoTHubUserIdentity>, Dapper_UserRepository>();
            services.AddScoped<IAccountRepository, Dapper_AccountRepository>();
            
             services.AddScoped<Common.Interfaces.Logging.ILogger, NullLogger>();

            services.AddIdentity<IoTHubUserIdentity, ApplicationRole>().AddDefaultTokenProviders();

            // 1. Add Authentication Services
            services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme).AddCookie();
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

            app.UseCors(builder =>
             builder.AllowAnyOrigin()
             .AllowAnyHeader()
             .AllowAnyMethod());

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
