using System;
using System.Collections.Generic;
using System.Text;
using Common.Interfaces.Repository;

namespace Common.Interfaces.Device
{
    public interface IDeviceAuthorizationRepository:IReadRepository<IDeviceAuthorizationCode, string, IDeviceAuthorizationCode>, IUpdateRepository<IDeviceAuthorizationCode, string, IDeviceAuthorizationCode>
    {
        string CreateAuthorizationCodeForDevice(int deviceId);

    }
}
