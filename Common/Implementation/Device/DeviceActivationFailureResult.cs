﻿using Common.Interfaces.Device;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Implementation.Device
{
    public class DeviceActivationFailureResult: FailureResult<IDevice, IEnumerable<string>>, IDeviceActivationResult
    {
    }
}
