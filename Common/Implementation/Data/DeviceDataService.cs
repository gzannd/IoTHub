using Common.Implementation.Account;
using Common.Implementation.Device;
using Common.Interfaces.Account;
using Common.Interfaces.Data;
using Common.Interfaces.Device;
using Common.Utilities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Implementation.Data
{
    public class DeviceDataService : IDeviceDataService
    {
        protected IDeviceDataRepository _deviceDataRepository;
        protected IDeviceRepository _deviceRepository;
        protected IAccountService _accountService; 

        public DeviceDataService(IDeviceDataRepository repository, IDeviceRepository deviceRepository, IAccountService accountService)
        {
            _deviceDataRepository = repository;
            _deviceRepository = deviceRepository;
            _accountService = accountService;
        }

        protected bool IsDeviceValid(Guid deviceId)
        {
            bool isValidResult = false;
            try
            {
                var result = _deviceRepository.GetItem(deviceId);
                var deviceIsValid = (result is DeviceSuccessResult && ((DeviceSuccessResult)result).Item.IsActive == true);

                if (deviceIsValid)
                {
                    var accountResult = _accountService.GetItem(result.Item.AccountId);
                    if (accountResult is AccountSuccessResult)
                    {
                        isValidResult = true;
                    }
                }
            }
            catch (Exception)
            {
                //We'll eat all exceptions here for now.
            }

            return isValidResult;
        }

        public IDeviceDataResult CreateItem(IDeviceData model)
        {
            try
            {
                if (IsDeviceValid(model.DeviceId))
                {
                    model.TimeStamp = DateTime.Now;
                    return _deviceDataRepository.CreateItem(model);
                }
                else
                {
                    return new DeviceDataFailureResult();
                }
            }
            catch(Exception e)
            {
                var failure = new DeviceDataFailureResult();
                failure.AddData(new List<string> { e.Message });
                return failure;
            }
        }

        public IDeviceDataResult GetItem(int key)
        {
            return _deviceDataRepository.GetItem(key);
        }

        public IEnumerable<IDeviceData> GetItems(DeviceDataQueryParameters parameters)
        {
            var filter = parameters.ConvertToFilter();
            var compiledDelegate = ExpressionBuilder.GetExpression<IDeviceData>(filter).Compile();
            return ((IDeviceDataService)this).GetItems(compiledDelegate);
        }

        IEnumerable<IDeviceData> IDeviceDataService.GetItems(Func<IDeviceData, bool> filter)
        {
            return _deviceDataRepository.GetItems(filter);
        }
    }
}
