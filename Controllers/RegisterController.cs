using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using Common.Implementation.User;
using Common.Interfaces.Logging;
using Common.Interfaces.User;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace IoTHub.Controllers
{
    [Route("api/register")]
    public class RegisterController : Controller
    {
        private IUserService _userService = null;
        private ILogger _logger = null;

        public RegisterController(IUserService userService, ILogger logger)
        {
            _userService = userService;
            _logger = logger;
        }


        [HttpGet]
        public IEnumerable<string> Register()
        {
            return new string[] { "value1", "value2" };
        }


        [HttpGet("{id}")]
        [Produces(typeof(UserDTO))]
        public IActionResult Get(int id)
        {
            var result = _userService.GetItem(id);

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
        public IActionResult Post([FromBody]UserDTO user)
        {
            var result = _userService.CreateItem(user);

            if(result is UserSuccessResult)
            {
                //Return an OK and put the URL to the created user in the header.
                return Created(Url.RouteUrl(result.Item.Id), result.Item.Id);
            }
            else
            {
                return BadRequest(string.Format("Unable to create user. {0}",
                    string.Join(",", (List<string>)result.Data)));
            }
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody]UserDTO user)
        {
            var result = _userService.UpdateItem(user);

            if (result is UserSuccessResult)
            {
                return Ok();
            }
            else
            {
                return BadRequest(string.Format("Unable to update user. {0}",
                    string.Join(",", (List<string>)result.Data)));
            }
        }
        
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            var result = _userService.DeleteItem(id);
            if(result is UserSuccessResult)
            {
                return Ok();
            }
            else
            {
                return BadRequest(string.Format("Unable to delete user. {0}",
                    string.Join(",", (List<string>)result.Data)));
            }
        }
    }
}
