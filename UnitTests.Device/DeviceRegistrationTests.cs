using Common.Implementation.Account;
using Common.Implementation.Device;
using Common.Implementation.Service;
using Common.Interfaces.Account;
using Common.Interfaces.Device;
using Common.Interfaces.Validator;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;
using System.Linq;
using UnitTests.Mocks.Account;
using UnitTests.Mocks.Device;
using UnitTests.Mocks.Logging;

namespace UnitTests.Device
{
    [TestClass]
    public class DeviceRegistrationTests
    {
        private IAccountService _mockAccountService;
        private IDeviceManagementService _deviceManagementService;
        private IAccountRepository _mockAccountRepository;
        private IDeviceRepository _mockDeviceRepository;
        private IDeviceAuthorizationRepository _mockDeviceAuthorizationRepository;

        [TestInitialize]
        public void Init()
        {
            _mockDeviceRepository = new MockDeviceRepository();
            _mockDeviceAuthorizationRepository = new MockDeviceAuthorizationRepository();
            _mockAccountRepository = new MockAccountRepository();
            _mockAccountRepository.CreateItem(new AccountDTO { Name = "TestAccount1" });

            _mockAccountService = new AccountService(_mockAccountRepository, new Validator<IAccount>(new List<AccountValidator>() { new AccountValidator() }), new MockLogger());
            _deviceManagementService = new DeviceManagementService(_mockAccountService, _mockDeviceRepository, _mockDeviceAuthorizationRepository, new Validator<IDevice>(new List<IValidator<IDevice>> { new DeviceValidator() }));
        }

        [TestMethod]
        public void TestRegisterDeviceOnExistingAccountSucceeds()
        {
            var newDevice = new DeviceDTO
            {
                Name = "TestDevice1",
                MACAddress = "1234567"
            };

            var account = _mockAccountRepository.GetItems(a => a.Name == "TestAccount1")
                .ToList()
                .FirstOrDefault();

            Assert.IsNotNull(account);
            Assert.IsInstanceOfType(account, typeof (AccountSuccessResult));

            var registrationResult = _deviceManagementService.RegisterDevice(account.Item, newDevice);
            Assert.IsInstanceOfType(registrationResult, typeof(DeviceRegistrationSuccessResult));

            var devices = _deviceManagementService.GetDevices(account.Item);
            Assert.AreEqual(1, devices.Count);
        }

        [TestMethod]
        public void TestRegisterMultipleDevicesOnExistingAccountSucceeds()
        {
            var newDevice = new DeviceDTO
            {
                Name = "TestDevice1",
                MACAddress = "1234567"
            };

            var account = _mockAccountRepository.GetItems(a => a.Name == "TestAccount1")
                .ToList()
                .FirstOrDefault();

            Assert.IsNotNull(account);
            Assert.IsInstanceOfType(account, typeof(AccountSuccessResult));

            var registrationResult = _deviceManagementService.RegisterDevice(account.Item, new DeviceDTO
            {
                Name = "TestDevice1",
                MACAddress = "1234567"
            });
            Assert.IsInstanceOfType(registrationResult, typeof(DeviceRegistrationSuccessResult));


            registrationResult = _deviceManagementService.RegisterDevice(account.Item, new DeviceDTO
            {
                Name = "TestDevice2",
                MACAddress = "12345678"
            });
            Assert.IsInstanceOfType(registrationResult, typeof(DeviceRegistrationSuccessResult));

            var devices = _deviceManagementService.GetDevices(account.Item);
            Assert.AreEqual(2, devices.Count);
        }


        [TestMethod]
        public void TestRegisterDeviceWithDuplicateMACAddressFails()
        {
            var newDevice = new DeviceDTO
            {
                Name = "TestDevice1",
                MACAddress = "1234567"
            };

            var account = _mockAccountRepository.GetItems(a => a.Name == "TestAccount1")
                .ToList()
                .FirstOrDefault();

            Assert.IsNotNull(account);
            Assert.IsInstanceOfType(account, typeof(AccountSuccessResult));

            var registrationResult = _deviceManagementService.RegisterDevice(account.Item, newDevice);
            Assert.IsInstanceOfType(registrationResult, typeof(DeviceRegistrationSuccessResult));

            var newDevice2 = new DeviceDTO
            {
                Name = "TestDevice2",
                MACAddress = "1234567"
            };
            
            registrationResult = _deviceManagementService.RegisterDevice(account.Item, newDevice2);
            Assert.IsInstanceOfType(registrationResult, typeof(DeviceRegistrationFailureResult));

            var devices = _deviceManagementService.GetDevices(account.Item);
            Assert.AreEqual(1, devices.Count);
        }

        [TestMethod]
        public void TestRegisterDeviceOnNonExistingAccountFails()
        {
            var newDevice = new DeviceDTO
            {
                Name = "TestDevice1"
            };

            var account = _mockAccountRepository.GetItems(a => a.Name == "TestAccount2")
                .ToList()
                .FirstOrDefault();

            Assert.IsNull(account);
            var bogusAccount = new AccountDTO { Name = "TestAccount2" };

            var registrationResult = _deviceManagementService.RegisterDevice(bogusAccount, newDevice);
            Assert.IsInstanceOfType(registrationResult, typeof(DeviceRegistrationFailureResult));
        }

        [TestMethod]
        public void TestUnregisterDeviceSucceeds()
        {
            var newDevice = new DeviceDTO
            {
                Name = "TestDevice1",
                MACAddress = "1234567"
            };

            var account = _mockAccountRepository.GetItems(a => a.Name == "TestAccount1")
                .ToList()
                .FirstOrDefault();

            Assert.IsNotNull(account);
            Assert.IsInstanceOfType(account, typeof(AccountSuccessResult));

            var registrationResult = _deviceManagementService.RegisterDevice(account.Item, newDevice);
            Assert.IsInstanceOfType(registrationResult, typeof(DeviceRegistrationSuccessResult));

            var devices = _deviceManagementService.GetDevices(account.Item);
            Assert.AreEqual(1, devices.Count);

            var unregisterResult = _deviceManagementService.UnRegisterDevice(account.Item, devices.First());
            Assert.IsInstanceOfType(unregisterResult, typeof(DeviceRegistrationSuccessResult));

            devices = _deviceManagementService.GetDevices(account.Item);
            Assert.AreEqual(0, devices.Count);
        }
    }
}
