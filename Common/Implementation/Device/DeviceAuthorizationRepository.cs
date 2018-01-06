using Common.Interfaces.Device;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Implementation.Device
{
    public class DeviceAuthorizationRepository : IDeviceAuthorizationRepository
    {
        public string CreateAuthorizationCodeForDevice(int deviceId)
        {
            throw new NotImplementedException();
        }

        public IDeviceAuthorizationCode GetItem(string key)
        {
            throw new NotImplementedException();
        }

        public IDeviceAuthorizationCode UpdateItem(IDeviceAuthorizationCode model)
        {
            throw new NotImplementedException();
        }
    }
}
