using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Interfaces.User
{
    public interface IUser
    {
        int Id { get; set; }
        string FirstName { get; set; }
        string LastName { get; set; }
        string Email { get; set; }
        string PhoneNumber { get; set; }
        bool IsActive { get; set; }
    }
}
