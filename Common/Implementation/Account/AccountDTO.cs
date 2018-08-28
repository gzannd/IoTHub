using Common.Interfaces.Account;
using Dapper.Contrib.Extensions;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Implementation.Account
{
    public class AccountDTO : IAccount
    {
        [Computed]
        public int AccountId { get; set; }

        public string UserId { get; set; }

        public string Name { get; set; }

        public string Description {get;set;}

        public DateTime DateCreated { get; set; }

        public bool IsActive { get; set; }
    }
}
