using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Interfaces.Account
{
    public interface IAccount
    {
        int AccountId { get; set; }
        string UserId { get; set; }
        string Name { get; set; }
        string Description { get; set; }
        DateTime DateCreated { get; set; }
        bool IsActive { get; set; }
    }
}
