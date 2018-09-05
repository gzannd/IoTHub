using Common.Interfaces.User;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Implementation.User
{
    public class UserDTO : IoTHubUserIdentity, IUser
    {
        string IUser.Id { get; set; }
    }

    public class UserPasswordDTO:UserDTO
    {
        public string Password { get; set; }
    }
}
