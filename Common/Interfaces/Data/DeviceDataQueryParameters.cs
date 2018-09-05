using Common.Utilities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Interfaces.Data
{
    public class DeviceDataQueryParameters
    {
        Guid DeviceId { get; set; }
        Guid TopicId { get; set; }
        DateTime? StartDate { get; set; }
        DateTime? EndDate { get; set; }

        public List<Filter> ConvertToFilter()
        {
            if(DeviceId != null && TopicId != null)
            { 
                var filterList = new List<Filter>
                {
                    new Filter{PropertyName = "DeviceDataId", Value = DeviceId, Operation = Operation.Equals},
                    new Filter{PropertyName = "TopicId", Value = TopicId, Operation = Operation.Equals}
                };

                if(StartDate != null)
                {
                    filterList.Add(new Filter { PropertyName = "TimeStamp", Operation = Operation.GreaterThanOrEqual, Value = StartDate });
                }

                if(EndDate != null)
                {
                    filterList.Add(new Filter { PropertyName = "TimeStamp", Operation = Operation.LessThanOrEqual, Value = EndDate });
                }

                return filterList;
            }
            else
            {
                throw new Exception("Device Data Query must contain a Device Id and Topic Id.");
            }
        }
    }
}
