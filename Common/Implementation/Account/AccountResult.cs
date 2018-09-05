using Common.Interfaces.Account;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Implementation.Account
{
    public class AccountSuccessResult : SuccessResult<IAccount, string>, IAccountResult
    {

    }

    public class AccountFailureResult : FailureResult<IAccount, string>, IAccountResult
    {
    }

    public class AccountNotFoundResult : AccountFailureResult
    { }
}
