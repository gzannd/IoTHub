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
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;

namespace IoTHub.Controllers
{
    [Produces("application/json")]
    [Route("api/User")]
    public class UserController : Controller
    {
        private IUserService _userService;

        public UserController(IUserService userService)
        {
            _userService = userService;
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
        public IActionResult Delete(string id)
        {
            var result = _userService.DeleteItem(id);
            if (result is UserSuccessResult)
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