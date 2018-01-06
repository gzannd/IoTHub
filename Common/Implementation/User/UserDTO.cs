using Common.Interfaces.User;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Implementation.User
{
    public class UserDTO : IUser
    {
        public int Id {get; set;}

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string PhoneNumber { get; set; }

        public string Email { get; set; }

        public bool IsActive { get; set; }
    }
}
