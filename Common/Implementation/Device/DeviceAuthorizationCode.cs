using Common.Interfaces.Device;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Implementation.Device
{
    public class DeviceAuthorizationCode : IDeviceAuthorizationCode
    {
        public DeviceAuthorizationCode()
        {
            DateIssued = DateTime.Now;
        }

        public Guid DeviceId { get; set; }
        public string Code { get; set; }
        public DateTime DateIssued { get; set; }
        public DateTime? DateVerified { get; set; }
    }
}
