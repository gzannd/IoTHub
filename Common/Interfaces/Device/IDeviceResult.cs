using Common.Interfaces.Repository;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Interfaces.Device
{
    public interface IDeviceResult:IResult<IDevice, IEnumerable<string>>
    {
    }
}
