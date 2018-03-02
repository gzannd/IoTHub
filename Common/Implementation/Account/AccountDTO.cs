using Common.Interfaces.Account;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Implementation.Account
{
    public class AccountDTO : IAccount
    {
        public int Id { get; set; }

        public int UserId { get; set; }

        public string Name { get; set; }

        public string Description {get;set;}

        public DateTime DateCreated { get; set; }

        public string Password { get; set; }

        public bool IsActive { get; set; }
    }
}
