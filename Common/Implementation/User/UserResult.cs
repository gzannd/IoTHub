﻿using Common.Interfaces.User;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Implementation.User
{
    public class UserSuccessResult : SuccessResult<IUser, IEnumerable<string>>, IUserResult
    {

    }

    public class UserFailureResult : FailureResult<IUser, IEnumerable<string>>, IUserResult
    {

    }
}
