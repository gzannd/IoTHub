using Common.Interfaces.Repository;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Interfaces.Data
{
    public interface IDeviceDataRepository:IReadRepository<IDeviceData, int, IDeviceDataResult>, IWriteRepository<IDeviceData, int, IDeviceDataResult>, IListReadRepository<IDeviceData, int, IDeviceData>
    {

    }
}
