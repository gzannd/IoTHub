using Common.Interfaces.Device;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Implementation.Device
{
    public class DeviceRegistrationSuccessResult :  SuccessResult<IDevice, IEnumerable<string>>, IDeviceRegistrationResult
    {
        public string RegistrationCode { get; set; }
    }
}
