﻿using Common.Implementation.Account;
using Common.Interfaces.Account;
using Common.Interfaces.Device;
using Common.Interfaces.Repository;
using System;
using System.Collections.Generic;
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
        public IDeviceActivationResult ActivateDevice(IAccount account, IDevice device, string activationCode)
        {
            //Verify that the account is valid.
            var accountResult = _accountService.GetItem(account.Id);

            //Verify that the activation code matches the most recent pending code 
            if(accountResult is AccountSuccessResult)
            {
                device.IsActive = true;
                _deviceRepository.UpdateItem(device);
            }
        }

        /// <summary>
        /// Toggles a device from active to inactive
        /// </summary>
        /// <param name="account"></param>
        /// <param name="device"></param>
        /// <returns></returns>
        public IDeviceActivationResult DeactivateDevice(IAccount account, IDevice device)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Authorizes use of a device on an account.
        /// </summary>
        /// <param name="account"></param>
        /// <param name="device"></param>
        /// <returns></returns>
        public IDeviceAuthorizationResult AuthorizeDevice(IAccount account, IDevice device)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Deauthorizes use of a device on an account.
        /// </summary>
        /// <param name="account"></param>
        /// <param name="device"></param>
        /// <returns></returns>
        public IDeviceAuthorizationResult DeauthorizeDevice(IAccount account, IDevice device)
        {
            throw new NotImplementedException();
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
            throw new NotImplementedException();
        }
    }
}