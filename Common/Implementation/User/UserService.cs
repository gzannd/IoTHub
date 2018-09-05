using Common.Implementation.Service;
using Common.Interfaces.Data;
using Common.Interfaces.Logging;
using Common.Interfaces.Repository;
using Common.Interfaces.User;
using Common.Interfaces.Validator;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.Implementation.User
{
    public class UserService:IUserService, IUserRepository, ICommittable
    {
        protected UserManager<IoTHubUserIdentity> userManager;
        protected ILogger logger;
        protected IValidator<IUser> userValidator;

        public IDbTransaction Transaction => throw new NotImplementedException();

        public UserService(UserManager<IoTHubUserIdentity> userManager, ILogger logger, IValidator<IUser> userValidator)
        {
            this.userManager = userManager;
            this.logger = logger;
            this.userValidator = userValidator;
        }

        public void Commit()
        {
            
        }

        public void Rollback()
        {
        
        }

        public bool EmailExists(string email)
        {
            return !(userManager.FindByEmailAsync(email) == null);
        }

        public async Task<IUserResult> CreateItem(IUser userDTO, string password)
        {
            IUserResult result = null;
            var validationErrors = userValidator.Validate(userDTO);

            if (validationErrors.Count() == 0)
            {
                ((IoTHubUserIdentity)userDTO).UserName = userDTO.Email;

                var createResult = await userManager.CreateAsync((IoTHubUserIdentity)userDTO, password);

                if (createResult.Succeeded)
                {
                    result = new UserSuccessResult() { Item = userDTO };
                }
                else
                {
                    result = new UserFailureResult() { Item = userDTO };
                }
            }
            else
            {
                result = new UserFailureResult() { Item = userDTO };
                result.AddData(validationErrors);
            }

            return result;
        }

        public IUserResult DeleteItem(IUser model)
        {
            //return userRepository.DeleteItem(model);
            return null;
        }

        public IUserResult DeleteItem(string key)
        {
           // return userRepository.DeleteItem(key);
            return null;
        }

        public IUserResult GetItem(string key)
        {
            // return userRepository.GetItem(key);
            return null;
        }

        public IEnumerable<IUserResult> GetItems(Func<IUser, bool> filter = null)
        {
            //return userRepository.GetItems(filter);
            return null;
        }

        public IUserResult UpdateItem(IUser model)
        {
            IUserResult result = null;

            if (string.IsNullOrEmpty(model.Id) == false)
            {
                //return userRepository.UpdateItem(model);
                return null;
            }
            else
            {
                var exception = new Exception("Invalid User ID.");
                logger.Log(exception);

                throw exception;
            }
        }

        bool IUserRepository.EmailExists(string email)
        {
            var result = userManager.FindByEmailAsync( email);
            return result.Result != null;
        }

        Task IUserRepository.CreateAsync(IUser user)
        {
            throw new NotImplementedException();
        }

        IUserResult IReadRepository<IUser, string, IUserResult>.GetItem(string key)
        {
            throw new NotImplementedException();
        }

        IUserResult IUpdateRepository<IUser, string, IUserResult>.UpdateItem(IUser model)
        {
            throw new NotImplementedException();
        }

        IEnumerable<IUserResult> IListReadRepository<IUser, string, IUserResult>.GetItems(Func<IUser, bool> filter)
        {
            throw new NotImplementedException();
        }

        
        IUserResult IWriteRepository<IUser, string, IUserResult>.CreateItem(IUser model)
        {
            throw new NotImplementedException();
        }

        IUserResult IDeleteRepository<IUser, string, IUserResult>.DeleteItem(IUser model)
        {
            throw new NotImplementedException();
        }

        IUserResult IDeleteRepository<IUser, string, IUserResult>.DeleteItem(string key)
        {
            throw new NotImplementedException();
        }
    }
}
