using Common.Interfaces.User;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Implementation.User
{
    public class UserDTO : IoTHubUserIdentity
    {
    }

    public class UserPasswordDTO:UserDTO
    {
        public string Password { get; set; }
    }
}
