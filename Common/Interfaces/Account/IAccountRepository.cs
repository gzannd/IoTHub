using Common.Interfaces.Repository;
using Common.Interfaces.User;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Interfaces.Account
{
    public interface IAccountRepository: IGenericRepository<IAccount, int, IAccountResult>
    {
        IAccountResult DeactivateAllAccounts(string userId);
        IAccountResult ActivateAccount(string userId, int accountId);
    }
}
