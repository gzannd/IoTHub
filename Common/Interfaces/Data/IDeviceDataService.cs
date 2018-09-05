using System;
using System.Collections.Generic;
using Common.Interfaces.Data;

namespace Common.Interfaces.Data
{
    public interface IDeviceDataService
    {
        IDeviceDataResult CreateItem(IDeviceData model);
        IDeviceDataResult GetItem(int key);
        IEnumerable<IDeviceData> GetItems(Func<IDeviceData, bool> filter = null);
    }
}