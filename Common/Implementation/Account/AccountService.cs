using Common.Implementation.Service;
using Common.Interfaces.Account;
using Common.Interfaces.Logging;
using Common.Interfaces.Repository;
using Common.Interfaces.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Common.Implementation.Account
{
    public class AccountService : IAccountService
    {
        private IAccountRepository _repository = null;
        protected Validator<IAccount> _validator = null;
        protected ILogger _logger = null;

        public AccountService(IAccountRepository repository, Validator<IAccount> validator, ILogger logger)
        {
            _repository = repository;
            _validator = validator;
            _logger = logger;
        }

        public IAccountResult CreateItem (IUser user, IAccount model)
        {
            if(user != null)
            {
                model.UserId = user.Id;
            }
            
            return CreateItem(model);
        }

        protected IAccountResult CreateItem(IAccount model)
        {
            IAccountResult result;
            
            var validationErrors = _validator.Validate(model).ToList();
            if (validationErrors.Count == 0)
            {
                result = _repository.CreateItem(model);
            }
            else
            {
                result = new AccountFailureResult() { Item = model };
                ((List<string>)result.Data).AddRange(validationErrors);
            }

            return result;
        }

        IAccountResult IWriteRepository<IAccount, int, IAccountResult>.CreateItem(IAccount model)
        {
            return CreateItem(model);
        }

        public IAccountResult DeleteItem(IAccount model)
        {
            return _repository.DeleteItem(model.Id);
        }

        public IAccountResult DeleteItem(int key)
        {
            return _repository.DeleteItem(key);
        }

        public IAccountResult GetItem(int key)
        {
            return _repository.GetItem(key);
        }

        public IEnumerable<IAccountResult> GetItems(Func<IAccount, bool> filter = null)
        {
            return _repository.GetItems(filter);
        }

        public IAccountResult UpdateItem(IAccount model)
        {
            IAccountResult result;

            var validationErrors = _validator.Validate(model);
            if(validationErrors.Count() == 0)
            {
                result = _repository.UpdateItem(model);
            }
            else
            {
                result = new AccountFailureResult() { Item = model };
                ((List<string>)result.Data).AddRange(validationErrors);
            }

            return result;
        }
    }
}
