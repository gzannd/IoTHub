using Common.Interfaces.Data;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Implementation
{
    public class DeviceData : IDeviceData
    {
        public int DeviceDataId { get; set; }
        public Guid DeviceId { get; set; }
        public Guid TopicId { get; set; }
        public DateTime TimeStamp { get; set; }
        public string Data { get; set; }
    }
}   
