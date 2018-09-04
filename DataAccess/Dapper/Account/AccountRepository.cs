using Common.Implementation.Account;
using Common.Interfaces.Account;
using Common.Interfaces.Data;
using Common.Interfaces.Repository;
using Dapper;
using Dapper.Contrib.Extensions;
using DataAccess.Connection;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace DataAccess.Dapper.Account
{
    public class Dapper_AccountRepository : IAccountRepository, ICommittable
    {
        IConnectionFactory _connectionFactory;

        public IDbTransaction Transaction => throw new NotImplementedException();

        public Dapper_AccountRepository(IConnectionFactory connectionFactory)
        {
            _connectionFactory = connectionFactory;
        }

        public void Commit()
        {
            ((ICommittable)_connectionFactory).Commit();
        }

        public void Rollback()
        {
            ((ICommittable)_connectionFactory).Rollback();
        }
        
        public IAccountResult CreateItem(IAccount model)
        {
            IAccountResult accountResult;
            var conn = _connectionFactory.GetConnection();
            model.DateCreated = DateTime.Now;

            var sql = "INSERT INTO Accounts (UserId, Name, Description, DateCreated, IsActive) " + 
                "VALUES (@UserId, @Name, @Description, @DateCreated, @IsActive);" +
                "SELECT CAST(SCOPE_IDENTITY() AS INT)";

            var temp = conn.Query<int>(sql, model).Single();
            model.AccountId = temp;

                if (temp > 0)
                {
                    accountResult = new AccountSuccessResult();
                    accountResult.Item = model;
                }
                else
                {
                    accountResult = new AccountFailureResult();
                }
            

            return accountResult;
        }

        public IAccountResult DeleteItem(IAccount model)
        {
            IAccountResult accountResult;
            using (var conn = _connectionFactory.GetConnection())
            {
                var result = conn.Delete(model);

                if(result == true)
                {
                    accountResult = new AccountSuccessResult();
                }
                else
                {
                    accountResult = new AccountFailureResult();
                }
            }

            return accountResult;
        }

        public IAccountResult DeleteItem(int key)
        {
            return DeleteItem(new AccountDTO { AccountId = key });
        }

        public IAccountResult ActivateAccount(string userId, int accountId)
        {
            var sql = "UPDATE Accounts SET IsActive = 0 WHERE UserID = {0} AND AccountId = {1}";

            IAccountResult accountResult = null;
            using (var conn = _connectionFactory.GetConnection())
            {
                var result = conn.Execute(string.Format(sql, userId, accountId));

                accountResult = new AccountSuccessResult();
                accountResult.AddData(string.Format("{0} account(s) activated.", result));
            }

            return accountResult;
        }

        public IAccountResult DeactivateAllAccounts(string userId)
        {
            var sql = "UPDATE Accounts SET IsActive = 0 WHERE UserID = {0}";

            IAccountResult accountResult = null;
            using (var conn = _connectionFactory.GetConnection())
            {
                var result = conn.Execute(string.Format(sql, userId));

                accountResult = new AccountSuccessResult();
                accountResult.AddData(string.Format("{0} account(s) deactivated.", result));
            }

            return accountResult;
        }

        public IAccountResult GetItem(int key)
        {
            IAccountResult accountResult;
            using (var conn = _connectionFactory.GetConnection())
            {
                var result = conn.Get<IAccount>(new AccountDTO { AccountId = key });

                if (result != null)
                {
                    accountResult = new AccountSuccessResult();
                    accountResult.Item = result;
                }
                else
                {
                    accountResult = new AccountFailureResult();
                    accountResult.AddData("Unable to locate account Id " + key);
                }
            }

            return accountResult;
        }

        public IEnumerable<IAccountResult> GetItems(Func<IAccount, bool> filter = null)
        {
            throw new NotImplementedException();
        }

        public IAccountResult UpdateItem(IAccount model)
        {
            IAccountResult accountResult;
            using (var conn = _connectionFactory.GetConnection())
            {
                var result = conn.Update(model);

                if (result == true)
                {
                    accountResult = new AccountSuccessResult();
                    accountResult.Item = model;
                }
                else
                {
                    accountResult = new AccountFailureResult();
                    accountResult.AddData("Unable to update account Id " + model.AccountId);
                }
            }

            return accountResult;
        }
    }
}
