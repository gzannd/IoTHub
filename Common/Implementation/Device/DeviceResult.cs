using Common.Interfaces.Device;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Implementation.Device
{
    public class DeviceSuccessResult : SuccessResult<IDevice, IEnumerable<string>>, IDeviceResult
    {

    }

    public class DeviceFailureResult : FailureResult<IDevice, IEnumerable<string>>, IDeviceResult
    {

    }
}
