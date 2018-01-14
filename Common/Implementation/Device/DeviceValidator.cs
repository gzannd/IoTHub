using Common.Interfaces.Device;
using Common.Interfaces.Validator;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Implementation.Device
{
    public class DeviceValidator : IValidator<IDevice>
    {
        public IEnumerable<string> Validate(IDevice subject)
        {
            var validationErrors = new List<string>();

            if(subject != null)
            {
                if(string.IsNullOrEmpty(subject.Name))
                {
                    validationErrors.Add("Device name cannot be null.");
                }

                if(string.IsNullOrEmpty(subject.MACAddress))
                {
                    validationErrors.Add("Device MAC address cannot be null.");
                }
            }
            else
            {
                validationErrors.Add("Device is NULL.");
            }

            return validationErrors;
        }

    }
}
