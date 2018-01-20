using Common.Interfaces.Repository;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Interfaces.Data
{
    public interface IDeviceDataResult: IResult<IDeviceData, IEnumerable<string>>
    {
    }
}
