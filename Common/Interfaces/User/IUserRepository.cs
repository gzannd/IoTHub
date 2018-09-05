using Common.Interfaces.Repository;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Common.Interfaces.User
{
    public interface IUserRepository:IGenericRepository<IUser, string, IUserResult>
    {
        bool EmailExists(string email);
        Task CreateAsync(IUser user);
    }
}
