using Common.Interfaces.Data;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Implementation.Data
{
    public class DeviceDataFailureResult : FailureResult<IDeviceData, IEnumerable<string>>, IDeviceDataResult
    {

    }
}
