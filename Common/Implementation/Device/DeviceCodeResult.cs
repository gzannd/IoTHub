using Common.Interfaces.Device;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Implementation.Device
{
    public class DeviceActivationCodeSuccessResult : SuccessResult<string, IEnumerable<string>>, IDeviceActivationCodeResult
    {

    }

    public class DeviceActivationCodeFailureResult : FailureResult<string, IEnumerable<string>>, IDeviceActivationCodeResult
    {

    }
}
