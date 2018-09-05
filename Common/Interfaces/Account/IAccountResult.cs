using Common.Interfaces.Repository;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Interfaces.Account
{
    public interface IAccountResult : IResult<IAccount, string>
    {
    }
}
