using Common.Interfaces.Repository;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Interfaces.User
{
    public interface IUserRepository:IGenericRepository<IUser, int, IUserResult>
    {

    }
}
