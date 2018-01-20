using Common.Interfaces.Data;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Implementation.Data
{
    public class DeviceDataRepository : IDeviceDataRepository
    {
        public IDeviceDataResult CreateItem(IDeviceData model)
        {
            throw new NotImplementedException();
        }

        public IDeviceDataResult GetItem(int key)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<IDeviceData> GetItems(Func<IDeviceData, bool> filter = null)
        {
            throw new NotImplementedException();
        }
    }
}
