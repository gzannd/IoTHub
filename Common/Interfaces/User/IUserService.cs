using Common.Interfaces.Repository;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Common.Interfaces.User
{
    public interface IUserService:IUserRepository
    {
        Task<IUserResult> CreateItem(IUser userDTO, string password);
    }
}
