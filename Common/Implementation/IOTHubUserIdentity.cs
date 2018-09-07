using Common.Implementation.User;
using Common.Interfaces.User;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common
{
    public class IoTHubUserIdentity :IUser
    {
        public string Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public bool IsActive { get; set; }
        public string UserName { get; set; }
        public string PasswordHash { get; set; }
        public string SecurityStamp { get; set; }
        public string ConfirmationToken { get; set; }
        public DateTime DateCreated { get; set; }
    }
}
