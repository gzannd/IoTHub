using Common.Interfaces.Data;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Implementation.Data
{
    public class DeviceDataSuccessResult:SuccessResult<IDeviceData, IEnumerable<string>>, IDeviceDataResult
    {
    }
}
