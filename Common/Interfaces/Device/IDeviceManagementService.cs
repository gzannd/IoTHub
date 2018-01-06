using Common.Interfaces.Account;
using Common.Interfaces.User;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Interfaces.Device
{
    public interface IDeviceManagementService
    {
        IDeviceRegistrationResult RegisterDevice(IAccount account, IDevice device);
        IDeviceRegistrationResult UnRegisterDevice(IAccount account, IDevice device);
        IDeviceActivationResult ActivateDevice(IAccount account, IDevice device);
        IDeviceActivationResult DeactivateDevice(IAccount account, IDevice device);
        IDeviceAuthorizationResult AuthorizeDevice(IAccount account, IDevice device);
        IDeviceAuthorizationResult DeauthorizeDevice(IAccount account, IDevice device);
    }

    public interface IDeviceAuthorizationService
    {
        IDeviceAuthorizationResult AuthorizeDevice(IAccount account, IDevice device);
        IDeviceAuthorizationResult DeauthorizeDevice();
    }
}
