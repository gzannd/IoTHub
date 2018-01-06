using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Interfaces.Device
{
    public interface IDevice
    {
        int DeviceId { get; set; }
        int ProfileId { get; set; }
        int AccountId { get; set; }

        string Name { get; set; }
        string Description { get; set; }
        bool IsActive { get; set; }
        DateTime DateCreated { get; set; }
    }
}
