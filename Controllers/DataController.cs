using Common.Implementation;
using Common.Interfaces.Data;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IoTHub.Controllers
{
    [Route("data")]
    public class DataController:Controller
    {
        private IDeviceDataService _deviceDataService;

        public DataController(IDeviceDataService deviceDataService)
        {
            _deviceDataService = deviceDataService;
        }

        [Route("{deviceId}/{topicId}")]
        public IActionResult Post([FromRoute]Guid deviceId, [FromRoute]Guid topicId, [FromBody]string data)
        {
            var model = new DeviceData
            {
                DeviceId = deviceId,
                Data = data,
                TopicId = topicId
            };

            var result = _deviceDataService.CreateItem(model);


        }
        
    }
}
