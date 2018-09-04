using Common.Implementation.Device;
using Common.Interfaces.Device;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace UnitTests.Mocks.Device
{
    public class MockDeviceRepository : IDeviceRepository
    {
        List<IDevice> devices = new List<IDevice>();

        public IDeviceResult CreateItem(IDevice model)
        {
            var device = new DeviceDTO()
            {
                DeviceId = Guid.NewGuid(),
                AccountId = model.AccountId,
                DateCreated = DateTime.Now,
                Description = model.Description,
                IsActive = false,
                Name = model.Name,
                ProfileId = model.ProfileId,
                MACAddress = model.MACAddress
            };

            devices.Add(device);

            return new DeviceRegistrationSuccessResult() { Item = device };
        }

        public IDeviceResult DeleteItem(IDevice model)
        {
            devices.Remove(devices.Where(d => d.DeviceId == model.DeviceId).FirstOrDefault());

            return new DeviceRegistrationSuccessResult() { };
        }

        public IDeviceResult DeleteItem(Guid key)
        {
            devices.Remove(devices.Where(d => d.DeviceId == key).FirstOrDefault());

            return new DeviceRegistrationSuccessResult() {  };
        }

        public bool DeviceWithMACAddressExists(string MACAddress)
        {
            return devices.Any(d => d.MACAddress == MACAddress);
        }

        public IDeviceResult GetItem(Guid key)
        {
            var device = devices.Where(d => d.DeviceId == key).FirstOrDefault();

            if(device == null)
            {
                return new DeviceFailureResult();
            }
            else
            {
                return new DeviceSuccessResult() { Item = device };
            }
        }

        public IEnumerable<IDeviceResult> GetItems(Func<IDevice, bool> filter = null)
        {
            var results = devices.Where(filter);
            var returnItems = new List<IDeviceResult>();
            foreach (var result in results)
            {
                returnItems.Add(new DeviceSuccessResult() { Item = result });
            }

            return returnItems;
        }

        public IDeviceResult UpdateItem(IDevice model)
        {
            var result = GetItem(model.DeviceId);

            if (result is DeviceSuccessResult)
            {
                result.Item.Description = model.Description;
                result.Item.IsActive = model.IsActive;
                result.Item.Name = model.Name;
                result.Item.ProfileId = model.ProfileId;
            }

            return result;
        }
    }
}
