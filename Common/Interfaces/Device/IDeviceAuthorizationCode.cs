﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Interfaces.Device
{
    public interface IDeviceAuthorizationCode
    {
        int DeviceId { get; set;}
        string Code { get; set; }
        DateTime DateIssued { get; set; }
        DateTime? DateVerified { get; set; }
    }
}
