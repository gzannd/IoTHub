using System.IO;
using Common.Implementation.Logging;
using Common.Implementation.User;
using Common.Interfaces.Repository;
using Common.Interfaces.User;
using Common.Interfaces.Validator;
using DataAccess.Connection;
using DataAccess.Dapper.User;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Common.Interfaces.Account;
using Common.Implementation.Account;
using DataAccess.Dapper.Account;
using Common.Implementation.UserAccount;
using Microsoft.AspNetCore.Authentication.Cookies;
using Common.Implementation;
using Microsoft.AspNetCore.Identity;
using Common;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authentication.OpenIdConnect;
using System.Threading.Tasks;
using System;

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
            //services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme).AddCookie();

            /*
            string domain = $"https://iothub.auth0.com/";
            services.AddAuthentication(options =>
            {
                options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;

            }).AddJwtBearer(options =>
            {
                options.Authority = domain;
                options.Audience = "iothub";
            });*/

            services.Configure<CookiePolicyOptions>(options =>
            {
                // This lambda determines whether user consent for non-essential cookies is needed for a given request.
                options.CheckConsentNeeded = context => true;
                options.MinimumSameSitePolicy = SameSiteMode.None;
            });

            // Add authentication services
            services.AddAuthentication(options => {
                options.DefaultAuthenticateScheme = CookieAuthenticationDefaults.AuthenticationScheme;
                options.DefaultSignInScheme = CookieAuthenticationDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = CookieAuthenticationDefaults.AuthenticationScheme;
            })
            .AddCookie()
            .AddOpenIdConnect("Auth0", options => {
        // Set the authority to your Auth0 domain
        options.Authority = $"https://iothub.auth0.com";

        // Configure the Auth0 Client ID and Client Secret
        options.ClientId = "m2EYcKppwUfYnT8bysIOTK8rY58fmYgB";
                options.ClientSecret = "6MzEgAbvYWiNUZKxQG7yf-SfAYG5OOuT8zBiyEgRvJ5fAGnjhIlGVX54I6JfxEIG";

        // Set response type to code
                options.ResponseType = "code";

        // Configure the scope
        options.Scope.Clear();
                options.Scope.Add("openid");

        // Set the callback path, so Auth0 will call back to http://localhost:5000/signin-auth0
        // Also ensure that you have added the URL as an Allowed Callback URL in your Auth0 dashboard
        options.CallbackPath = new PathString("/signin-auth0");

        // Configure the Claims Issuer to be Auth0
        options.ClaimsIssuer = "Auth0";

                options.Events = new OpenIdConnectEvents
                {
                    // handle the logout redirection
                    OnRedirectToIdentityProviderForSignOut = (context) =>
                    {
                        context.ProtocolMessage.SetParameter("audience", "iothub");

                        var logoutUri = $"https://iothub.auth0.com/v2/logout?client_id=m2EYcKppwUfYnT8bysIOTK8rY58fmYgB";

                        var postLogoutUri = context.Properties.RedirectUri;
                        if (!string.IsNullOrEmpty(postLogoutUri))
                        {
                            if (postLogoutUri.StartsWith("/"))
                            {
                        // transform to absolute
                        var request = context.Request;
                                postLogoutUri = request.Scheme + "://" + request.Host + request.PathBase + postLogoutUri;
                            }
                            logoutUri += $"&returnTo={ Uri.EscapeDataString(postLogoutUri)}";
                        }

                        context.Response.Redirect(logoutUri);
                        context.HandleResponse();

                        return Task.CompletedTask;
                    }
                };
            });

            // Add framework services.
            services.AddMvc()
                .SetCompatibilityVersion(CompatibilityVersion.Version_2_1);

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

            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseCookiePolicy();
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
