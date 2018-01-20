using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Interfaces.Data
{
    public interface IDeviceData
    {
        int DeviceDataId { get; set; }
        Guid DeviceId { get; set; }
        Guid TopicId { get; set; }
        DateTime TimeStamp { get; set;}
        string Data { get; set; }
    }
}
