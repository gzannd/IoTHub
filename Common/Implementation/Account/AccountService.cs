using Common.Implementation.Service;
using Common.Interfaces.Account;
using Common.Interfaces.Data;
using Common.Interfaces.Logging;
using Common.Interfaces.Repository;
using Common.Interfaces.User;
using Common.Interfaces.Validator;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Transactions;

namespace Common.Implementation.Account
{
    public class AccountService : IAccountService,ICommittable
    {
        private IAccountRepository _repository = null;
        protected IValidator<IAccount> _validator = null;
        protected ILogger _logger = null;

        public IDbTransaction Transaction => throw new NotImplementedException();

        public AccountService(IAccountRepository repository, IValidator<IAccount> validator, ILogger logger)
        {
            _repository = repository;
            _validator = validator;
            _logger = logger;
        }

        public void Commit()
        {
            ((ICommittable)_repository).Commit();
        }

        public void Rollback()
        {
            ((ICommittable)_repository).Rollback();
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
            return _repository.DeleteItem(model.AccountId);
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

        public IAccountResult ActivateAccount(string userId, int accountId)
        {
            return _repository.ActivateAccount(userId, accountId);
        }

        public IAccountResult DeactivateAllAccounts(string userId)
        {
            return _repository.DeactivateAllAccounts(userId);
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
