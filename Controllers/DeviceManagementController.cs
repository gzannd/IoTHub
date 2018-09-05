using Common.Implementation.Account;
using Common.Implementation.Device;
using Common.Interfaces.Account;
using Common.Interfaces.Device;
using Common.Interfaces.User;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IoTHub.Controllers
{
    [Route("api/device")]
    public class DeviceManagementController : Controller
    {
        private IDeviceManagementService _deviceManagementService;
        private IAccountService _accountService;

        public DeviceManagementController(IAccountService accountService, IDeviceManagementService deviceManagementService)
        {
            _deviceManagementService = deviceManagementService;
            _accountService = accountService;
        }

        [HttpPost]
        [Route("{accountId}")]
        public IActionResult RegisterDevice([FromRoute] int accountId, [FromBody] DeviceDTO device)
        {
            var accountResult = _accountService.GetItem(accountId);
            if (accountResult is AccountSuccessResult)
            {
                var deviceRegistrationResult = _deviceManagementService.RegisterDevice(accountResult.Item, device);

                if (deviceRegistrationResult is DeviceRegistrationSuccessResult)
                {
                    return Created(Url.RouteUrl(deviceRegistrationResult.Item.DeviceId), deviceRegistrationResult.Item.DeviceId);
                }
                else
                {
                    return BadRequest(deviceRegistrationResult.Data);
                }
            }
            else if (accountResult is AccountNotFoundResult)
            {
                //Failed to locate the account.
                return NotFound("Specified user account was not found.");
            }
            else
            {
                return BadRequest(accountResult.Data);
            }
        }

        [HttpDelete]
        [Route("{deviceId}")]
        public IActionResult UnregisterDevice([FromRoute] Guid deviceId)
        {
            var deviceResult = _deviceManagementService.GetDevice(deviceId);

            if (deviceResult is DeviceSuccessResult)
            {
                var accountResult = _accountService.GetItem(deviceResult.Item.AccountId);

                if (accountResult is AccountSuccessResult)
                {
                    var deviceUnregistrationResult = _deviceManagementService.UnRegisterDevice(accountResult.Item, deviceResult.Item);

                    if (deviceUnregistrationResult is DeviceRegistrationSuccessResult)
                    {
                        return Ok();
                    }
                    else
                    {
                        return StatusCode(500, deviceUnregistrationResult.Data);
                    }
                }
                else if (accountResult is AccountNotFoundResult)
                {
                    return NotFound("Specified user account was not found.");
                }
                else
                {
                    return BadRequest(accountResult.Data);
                }
            }
            else
            {
                return BadRequest(deviceResult.Data);
            }
        }

        [HttpPost]
        [Route("{deviceId}/activate")]
        public IActionResult ActivateDevice([FromRoute] Guid deviceId)
        {
            var deviceResult = _deviceManagementService.GetDevice(deviceId);

            if (deviceResult is DeviceSuccessResult)
            {
                var accountResult = _accountService.GetItem(deviceResult.Item.AccountId);

                if (accountResult is AccountSuccessResult)
                {
                    var deviceActivationResult = _deviceManagementService.ActivateDevice(accountResult.Item, deviceResult.Item);

                    if (deviceActivationResult is DeviceActivationSuccessResult)
                    {
                        return Ok();
                    }
                    else
                    {
                        return BadRequest(deviceActivationResult.Data);
                    }
                }
                else if (accountResult is AccountNotFoundResult)
                {
                    return NotFound("Specified user account was not found.");
                }
                else
                {
                    return BadRequest(accountResult.Data);
                }
            }
            else
            {
                return BadRequest(deviceResult.Data);
            }
        }

        [HttpPost]
        [Route("{deviceId}/deactivate")]
        public IActionResult DeactivateDevice([FromRoute] Guid deviceId)
        {
            var deviceResult = _deviceManagementService.GetDevice(deviceId);

            if (deviceResult is DeviceSuccessResult)
            {
                var accountResult = _accountService.GetItem(deviceResult.Item.AccountId);

                if (accountResult is AccountSuccessResult)
                {
                    var deviceActivationResult = _deviceManagementService.DeactivateDevice(accountResult.Item, deviceResult.Item);

                    if (deviceActivationResult is DeviceActivationSuccessResult)
                    {
                        return Ok();
                    }
                    else
                    {
                        return BadRequest(deviceActivationResult.Data);
                    }
                }
                else if (accountResult is AccountNotFoundResult)
                {
                    return NotFound("Specified user account was not found.");
                }
                else
                {
                    return BadRequest(accountResult.Data);
                }
            }
            else
            {
                return BadRequest(deviceResult.Data);
            }
        }

        [HttpPut]
        [Route("{deviceId}")]
        public IActionResult UpdateDevice([FromBody] DeviceDTO device)
        {
            var deviceResult = _deviceManagementService.GetDevice(device.DeviceId);

            if (deviceResult is DeviceSuccessResult)
            {
                var accountResult = _accountService.GetItem(deviceResult.Item.AccountId);

                if (accountResult is AccountSuccessResult)
                {
                    var deviceUpdateResult = _deviceManagementService.UpdateDevice(accountResult.Item, deviceResult.Item);

                    if (deviceUpdateResult is DeviceSuccessResult)
                    {
                        return Ok();
                    }
                    else
                    {
                        return BadRequest(deviceUpdateResult.Data);
                    }
                }
                else if (accountResult is AccountNotFoundResult)
                {
                    return NotFound("Specified user account was not found.");
                }
                else
                {
                    return BadRequest(accountResult.Data);
                }
            }
            else
            {
                return BadRequest(deviceResult.Data);
            }
        }

        [HttpGet]
        [Route("{deviceId}/authcode")]
        public IActionResult GetAuthorizationCode([FromRoute] Guid deviceId)
        {
            var deviceResult = _deviceManagementService.GetDevice(deviceId);

            if (deviceResult is DeviceSuccessResult)
            {
                var accountResult = _accountService.GetItem(deviceResult.Item.AccountId);

                if (accountResult is AccountSuccessResult)
                {
                    var authCodeResult = _deviceManagementService.CreateAuthorizationCodeForDevice(accountResult.Item, deviceResult.Item);
                    if(authCodeResult is DeviceActivationCodeSuccessResult)
                    {
                        return Ok(authCodeResult.Item);
                    }
                    else
                    {
                        return BadRequest(authCodeResult.Data);
                    }
                }
                else if (accountResult is AccountNotFoundResult)
                {
                    return NotFound("Specified user account was not found.");
                }
                else
                {
                    return BadRequest(accountResult.Data);
                }
            }
            else
            {
                return BadRequest(deviceResult.Data);
            }
        }

        [HttpPost]
        [Route("{deviceId}/authcode")]
        public IActionResult AuthorizeDevice([FromRoute] Guid deviceId, [FromBody] string activationCode)
        {
            var deviceResult = _deviceManagementService.GetDevice(deviceId);

            if (deviceResult is DeviceSuccessResult)
            {
                var accountResult = _accountService.GetItem(deviceResult.Item.AccountId);

                if (accountResult is AccountSuccessResult)
                {
                    var deviceAuthorizationResult = _deviceManagementService.AuthorizeDevice(accountResult.Item, deviceResult.Item, activationCode);

                    if (deviceAuthorizationResult is DeviceSuccessResult)
                    {
                        return Ok();
                    }
                    else
                    {
                        return BadRequest(deviceAuthorizationResult.Data);
                    }
                }
                else if (accountResult is AccountNotFoundResult)
                {
                    return NotFound("Specified user account was not found.");
                }
                else
                {
                    return BadRequest(accountResult.Data);
                }
            }
            else
            {
                return BadRequest(deviceResult.Data);
            }
        }
    }
}
