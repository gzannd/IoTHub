using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Interfaces.Device
{
    public interface IDeviceProfile
    {
        int ProfileId { get; set; }
        int CreateUserId { get; set; }
        int PreviousProfileVersionId { get; set; }

        string ProfileName { get; set; }
        string DeviceName { get; set;}

        bool IsActive { get; set; }

        DateTime DateCreated { get; set; }
    }
}
