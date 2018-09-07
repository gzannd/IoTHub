using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using Common.Implementation.Account;
using Common.Implementation.User;
using Common.Implementation.UserAccount;
using Common.Interfaces.Account;
using Common.Interfaces.Logging;
using Common.Interfaces.User;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace IoTHub.Controllers
{
    [Route("api/register")]
    public class RegisterController : Controller
    {
        private readonly IOptions<AppSettings> _appSettings = null;
        private IUserService _userService = null;
        private IAccountService _accountService = null;
        private ILogger _logger = null;
        private UserAccountService _userAccountService;

        public RegisterController(UserAccountService userAccountService, ILogger logger, IOptions<AppSettings> appSettings)
        {
            _userAccountService = userAccountService;
            _logger = logger;
            _appSettings = appSettings;

        }

        [HttpGet("user/{id}", Name = "GetUserById")]
        [Produces(typeof(UserDTO))]
        public IActionResult GetUserById(string id)
        {
            var result = _userAccountService.GetUser(id);

            if (result is UserSuccessResult)
            {
                return Ok(result.Item);
            }
            else
            {
                return NotFound(string.Format("Unable to locate user Id '{0}'", id));
            }
        }

        [HttpPost]
        public IActionResult Post([FromBody]UserPasswordDTO input)
        {
            var result = _userAccountService.CreateUserAndAccount(new UserDTO { Email = input.Email, FirstName = input.FirstName, LastName = input.LastName, PhoneNumber = input.PhoneNumber }, input.Password);
            if(result is UserSuccessResult)
            {
                //User and account successfully created. 
                var user = (UserDTO)result.Item;

                //Return an OK and put the URL to the created user in the header.
                return Created(Url.RouteUrl("GetUserById", new { id = result.Item.Id }), string.Format("User ID {0} created.", result.Item.Id));
            }
            else
            {
                return BadRequest(string.Format("Unable to create user. {0}",
                    string.Join(",", result.Data.Cast<string>())));
            }
        }

        /*
        [HttpPost("activate/{0}")]
        public IActionResult ValidateAccountActivationCode([FromRoute]string activationCode)
        {

        }*/

        [HttpGet]
        [Authorize]
        [Route("private")]
        public IActionResult TestAction()
        {
            return Json(new
            {
                Message = "Hello from a private endpoint! You need to be authenticated to see this."
            });
        }

        [HttpGet]
        [Route("token")]
        public IActionResult Token()
        {
            var result = RequestAuth0Token();
            if(result.Result != null)
            {
                return Ok(result.Result);
            }
            else
            {
                return BadRequest();
            }
        }

        private async Task<string> RequestAuth0Token()
        {
            HttpClient client = new HttpClient();
            var values = new Dictionary<string, string>
            {
                {"grant_type", "client_credentials" },
                {"client_id",  "-JyOiVVCzopfSa0xFkRmz4S5y3N24RGU"},
                {"client_secret", "V49RdTwUBFEAK28QMAQ_B15OrKWeHyeZJKtzIIUy-ACF_wtjdFRgJvs-P2SK6fET"},
                {"audience", "iothub" }
            };
            var content = new FormUrlEncodedContent(values);
            //content.Headers.Add("content-type", "application/json");
            var response = await client.PostAsync("https://iothub.auth0.com/oauth/token", content);
            var responseString = await response.Content.ReadAsStringAsync();

            return responseString;
        }
    }
}
