using Common.Implementation.Account;
using Common.Interfaces.Account;
using Common.Interfaces.Device;
using Common.Interfaces.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Common.Implementation.Device
{
    public class DeviceManagementService : IDeviceManagementService
    {
        protected IDeviceRepository _deviceRepository;
        protected IAccountService _accountService;
        protected IDeviceAuthorizationRepository _deviceAuthorizationRepository;

        public DeviceManagementService(IAccountService accountService, IDeviceRepository deviceRepository, IDeviceAuthorizationRepository deviceAuthorizationRepository)
        {
            _deviceRepository = deviceRepository;
            _accountService = accountService;
            _deviceAuthorizationRepository = deviceAuthorizationRepository;
        }
        
        /// <summary>
        /// Toggles a device from inactive to active.
        /// </summary>
        /// <param name="account"></param>
        /// <param name="device"></param>
        /// <returns></returns>
        public IDeviceActivationResult ActivateDevice(IAccount account, IDevice device)
        {
            IDeviceActivationResult result = null;

            if(ValidateAccount(account))
            {
                var deviceResult = _deviceRepository.GetItem(device.DeviceId);

                if(deviceResult is DeviceSuccessResult)
                {
                    deviceResult.Item.IsActive = true;
                    var updateResult = _deviceRepository.UpdateItem(deviceResult.Item);

                    if(updateResult is DeviceSuccessResult)
                    {
                        result = new DeviceActivationSuccessResult();
                    }
                    else
                    {
                        result = new DeviceActivationFailureResult() { Data = updateResult.Data };
                    }
                }
                else
                {
                    result = new DeviceActivationFailureResult();
                    result.AddData(new List<string>() { "Unable to retrieve device." });
                }
            }
            else
            {
                result = new DeviceActivationFailureResult() { Item = device };
                result.AddData(new List<string>() { "The account is not valid." });
            }

            return result;
        }

        /// <summary>
        /// Toggles a device from active to inactive
        /// </summary>
        /// <param name="account"></param>
        /// <param name="device"></param>
        /// <returns></returns>
        public IDeviceActivationResult DeactivateDevice(IAccount account, IDevice device)
        {
            IDeviceActivationResult result = null;

            //Verify that the account is valid.
            if (ValidateAccount(account))
            {
                device.IsActive = false;
                var deactivationResult = _deviceRepository.UpdateItem(device);

                if (deactivationResult is DeviceSuccessResult)
                {
                    result = new DeviceActivationSuccessResult();
                }
                else
                {
                    result = new DeviceActivationFailureResult() { Item = device, Data = deactivationResult.Data };
                }
            }
            else
            {
                result = new DeviceActivationFailureResult() { Item = device };
                result.AddData(new List<string>() { "The account is not valid." });
            }

            return result;
        }

        private bool ValidateAccount(IAccount account)
        {
            //Verify that the account is valid.
            try
            {
                return _accountService.GetItem(account.Id) is AccountSuccessResult;
            }
            catch(Exception)
            {
                return false;
            }
        }

        public IDeviceActivationCodeResult CreateAuthorizationCodeForDevice(IAccount account, IDevice device)
        {
            IDeviceActivationCodeResult result = null;

            if(ValidateAccount(account))
            {
                var code = _deviceAuthorizationRepository.CreateAuthorizationCodeForDevice(device.DeviceId);

                if(string.IsNullOrEmpty(code) == false)
                {
                    result = new DeviceActivationCodeSuccessResult() { Item = code };
                }
                else
                {
                    result = new DeviceActivationCodeFailureResult();
                }
            }
            else
            {
                result = new DeviceActivationCodeFailureResult();
                result.AddData( new List<string> { "The account is not valid." } );
            }

            return result;
        }

        /// <summary>
        /// Authorizes use of a device on an account.
        /// </summary>
        /// <param name="account"></param>
        /// <param name="device"></param>
        /// <returns></returns>
        public IDeviceAuthorizationResult AuthorizeDevice(IAccount account, IDevice device, string activationCode)
        {
            IDeviceAuthorizationResult result = null;

            //Verify that the account is valid.
            if (ValidateAccount(account))
            {
                //Get the most recent pending activation code for the device. 
                var codeItem = _deviceAuthorizationRepository.GetItem(activationCode);

                if (codeItem != null && codeItem.DeviceId == device.DeviceId)
                {
                    device.IsActive = true;
                    var updateResult = _deviceRepository.UpdateItem(device);

                    if (updateResult is DeviceSuccessResult)
                    {
                        try
                        {
                            _deviceAuthorizationRepository.InvalidateAuthorizationCodeForDevice(device.DeviceId);
                            result = new DeviceAuthorizationSuccessResult() { Item = device };
                        }
                        catch (Exception e)
                        {
                            //Unable to invalidate authorization code for some reason...
                            result = new DeviceAuthorizationFailureResult() { Item = device };
                            result.AddData(new List<string>() { e.Message });
                        }
                    }
                    else
                    {
                        result = new DeviceAuthorizationFailureResult() { Item = device, Data = updateResult.Data };
                    }
                }
                else
                {
                    result = new DeviceAuthorizationFailureResult() { Item = device };
                    result.AddData(new List<string>() { "The device ID is not valid." });
                }
            }
            else
            {
                result = new DeviceAuthorizationFailureResult() { Item = device };
                result.AddData(new List<string>() { "The account is not valid." });
            }

            return result;
        }

        /// <summary>
        /// Deauthorizes use of a device on an account.
        /// </summary>
        /// <param name="account"></param>
        /// <param name="device"></param>
        /// <returns></returns>
        public IDeviceAuthorizationResult DeauthorizeDevice(IAccount account, IDevice device)
        {
            IDeviceAuthorizationResult result = null;

            //Verify that the account is valid.
            if (ValidateAccount(account))
            {
                device.AuthorizationToken = null;
                var deauthorizationResult = _deviceRepository.UpdateItem(device);

                if (deauthorizationResult is DeviceSuccessResult)
                {
                    result = new DeviceAuthorizationSuccessResult();
                }
                else
                {
                    result = new DeviceAuthorizationFailureResult() { Item = device, Data = deauthorizationResult.Data };
                }
            }
            else
            {
                result = new DeviceAuthorizationFailureResult() { Item = device };
                result.AddData(new List<string>() { "The account is not valid." });
            }

            return result;
        }

        /// <summary>
        /// Registers a new device (or re-registers an existing device).
        /// </summary>
        /// <param name="account"></param>
        /// <param name="device"></param>
        /// <returns></returns>
        public IDeviceRegistrationResult RegisterDevice(IAccount account, IDevice device)
        {
            IDeviceRegistrationResult result = null;

            if(account != null)
            {
                //Validate that the account actually exists.    
                if(!(_accountService.GetItem(account.Id) is AccountSuccessResult))
                {
                    result = new DeviceRegistrationFailureResult();
                    result.AddData(new List<string> { "Account does not exist." });
                }
                else
                {
                    //Check to see if a device with the same MAC Address is already registered.
                    if (_deviceRepository.DeviceWithMACAddressExists(device.MACAddress))
                    {
                        result = new DeviceRegistrationFailureResult();
                        result.AddData(new List<string> { "A device with the same MAC address is already registered." });
                    }
                    else
                    {
                        device.AccountId = account.Id;
                        var createResult = _deviceRepository.CreateItem(device);

                        if (createResult is DeviceRegistrationSuccessResult)
                        {
                            result = new DeviceRegistrationSuccessResult() { Item = device };
                        }
                        else
                        {
                            result = new DeviceRegistrationFailureResult() { Data = createResult.Data };
                        }
                    }
                }
            }
            
            return result;
        }

        /// <summary>
        /// Unregisters a device.
        /// </summary>
        /// <param name="account"></param>
        /// <param name="device"></param>
        /// <returns></returns>
        public IDeviceRegistrationResult UnRegisterDevice(IAccount account, IDevice device)
        {
            IDeviceRegistrationResult result = null;

            if (account != null)
            {
                //Validate that the account actually exists.    
                if (!(_accountService.GetItem(account.Id) is AccountSuccessResult))
                {
                    result = new DeviceRegistrationFailureResult();
                    result.AddData(new List<string> { "Account does not exist." });
                }
                else
                {
                    var deleteResult = _deviceRepository.DeleteItem(device);

                    if (deleteResult is DeviceRegistrationSuccessResult)
                    {
                        result = new DeviceRegistrationSuccessResult() { Item = device };
                    }
                    else
                    {
                        result = new DeviceRegistrationFailureResult() { Data = deleteResult.Data };
                    }
                }
            }

            return result;
        }

        public IList<IDevice> GetDevices(IAccount account)
        {
            List<IDevice> devices = new List<IDevice>();

            //Verify that the account is valid.
            if (ValidateAccount(account))
            {
                var deviceResults = _deviceRepository.GetItems(d => d.AccountId == account.Id);
                devices.AddRange(deviceResults
                    .Select(r => r.Item)
                    .ToList());
            }

            return devices;
        }
    }
}
