using Common.Implementation;
using Common.Implementation.Data;
using Common.Interfaces.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace UnitTests.Mocks.Data
{
    public class MockDataRepository : IDeviceDataRepository
    {
        private List<IDeviceData> _data = new List<IDeviceData>();

        public IDeviceDataResult CreateItem(IDeviceData model)
        {
            var data = new DeviceData
            {
                DeviceDataId = _data.Max(d => d.DeviceDataId) + 1,
                DeviceId = model.DeviceId,
                Data = model.Data,
                TimeStamp = model.TimeStamp,
                TopicId = model.TopicId
            };

            _data.Add(data);

            return new DeviceDataSuccessResult() { Item = data };
        }

        public IDeviceDataResult GetItem(int key)
        {
            var result = _data.Where(d => d.DeviceDataId == key).FirstOrDefault();
            if(result == null)
            {
                return new DeviceDataFailureResult();
            }
            else
            {
                return new DeviceDataSuccessResult() { Item = result };
            }
        }

        public IEnumerable<IDeviceData> GetItems(Func<IDeviceData, bool> filter = null)
        {
            return _data.Where(filter);
        }
    }
}
