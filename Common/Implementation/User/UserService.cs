using Common.Implementation.Service;
using Common.Interfaces.Logging;
using Common.Interfaces.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Common.Implementation.User
{
    public class UserService:IUserService, IUserRepository
    {
        protected IUserRepository userRepository;
        protected ILogger logger;
        protected Validator<IUser> userValidator;

        public UserService(IUserRepository userRepository, ILogger logger, Validator<IUser> userValidator)
        {
            this.userRepository = userRepository;
            this.logger = logger;
            this.userValidator = userValidator;
        }

        public IUserResult CreateItem(IUser userDTO)
        {
            IUserResult result = null;
            var validationErrors = userValidator.Validate(userDTO);

            if(validationErrors.Count() == 0)
            {
                result = userRepository.CreateItem(userDTO);

                if (result is UserFailureResult)
                {
                    var exception = new Exception("Unable to create new user.");
                    ((List<string>)result.Data).Add(exception.Message);
                    logger.Log(exception);
                }
            }
            else
            {
                result = new UserFailureResult() { Item = userDTO};
                ((List<string>)result.Data).AddRange(validationErrors);
            }

            return result;
        }

        public IUserResult DeleteItem(IUser model)
        {
            return userRepository.DeleteItem(model);
        }

        public IUserResult DeleteItem(int key)
        {
            return userRepository.DeleteItem(key);
        }

        public IUserResult GetItem(int key)
        {
            return userRepository.GetItem(key);
        }

        public IEnumerable<IUserResult> GetItems(Func<IUser, bool> filter = null)
        {
            return userRepository.GetItems(filter);
        }

        public IUserResult UpdateItem(IUser model)
        {
            IUserResult result = null;

            if (model.Id > 0)
            {
                return userRepository.UpdateItem(model);
            }
            else
            {
                var exception = new Exception("Invalid User ID.");
                logger.Log(exception);

                throw exception;
            }
        }
    }
}
