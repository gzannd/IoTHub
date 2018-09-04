using Common.Implementation.Account;
using Common.Interfaces.Account;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace UnitTests.Mocks.Account
{
    public class MockAccountRepository : IAccountRepository
    {
        private List<IAccount> accounts = new List<IAccount>();

        public IAccountResult ActivateAccount(string userId, int accountId)
        {
            throw new NotImplementedException();
        }

        public IAccountResult CreateItem(IAccount model)
        {
            var temp = new AccountDTO()
            {
                AccountId = accounts.Count + 1,
                Name = model.Name,
                UserId = model.UserId,
                DateCreated = DateTime.Now,
                Description = model.Description
            };

            accounts.Add(temp);
            return new AccountSuccessResult() { Item = temp };
        }

        public IAccountResult DeactivateAllAccounts(string userId)
        {
            throw new NotImplementedException();
        }

        public IAccountResult DeleteItem(IAccount model)
        {
            return DeleteItem(model.AccountId);
        }

        public IAccountResult DeleteItem(int key)
        {
            var account = accounts.Where(a => a.AccountId == key).FirstOrDefault();
            if (account != null)
            {
                accounts.Remove(account);
                return new AccountSuccessResult() { Item = account };
            }
            else
            {
                return new AccountNotFoundResult();
            }
        }

        public IAccountResult GetItem(int key)
        {
            var account = accounts.Where(a => a.AccountId == key).FirstOrDefault();
            if(account != null)
            {
                return new AccountSuccessResult() { Item = account };
            }
            else
            {
                return new AccountNotFoundResult();
            }
        }

        public IEnumerable<IAccountResult> GetItems(Func<IAccount, bool> filter = null)
        {
            var results = accounts.Where(filter);
            var returnItems = new List<IAccountResult>();
            foreach(var result in results)
            {
                returnItems.Add(new AccountSuccessResult() { Item = result });
            }

            return returnItems;
        }

        public IAccountResult UpdateItem(IAccount model)
        {
            var accountResult = GetItem(model.AccountId);
            if(accountResult is AccountSuccessResult)
            {
                accountResult.Item.Name = model.Name;
                accountResult.Item.Description = model.Description;
                accountResult.Item.UserId = model.UserId;

                return new AccountSuccessResult() { Item = accountResult.Item };
            }
            else
            {
                return new AccountNotFoundResult();
            }
        }
    }
}
