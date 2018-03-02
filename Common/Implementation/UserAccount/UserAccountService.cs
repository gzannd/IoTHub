using Common.Implementation.Account;
using Common.Implementation.Service;
using Common.Implementation.User;
using Common.Interfaces.Account;
using Common.Interfaces.Data;
using Common.Interfaces.Logging;
using Common.Interfaces.Repository;
using Common.Interfaces.User;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Transactions;

namespace Common.Implementation.UserAccount
{
    public class UserAccountService:ICommittable
    {
        private IUserService _userService;
        private IAccountService _accountService;
        private ILogger _logger;

        public IDbTransaction Transaction => throw new NotImplementedException();

        public UserAccountService(IUserService userService, IAccountService accountService, ILogger logger)
        {
            _userService = userService;
            _accountService = accountService;
            _logger = logger;
        }

        public void Rollback()
        {
            ((ICommittable)_userService).Rollback();
            ((ICommittable)_accountService).Rollback();
        }
        public void Commit()
        {
            ((ICommittable)_userService).Commit();
            ((ICommittable)_accountService).Commit();
        }

        public IUserResult DeactivateUser(IUser userDTO)
        {
            IUserResult userDeactivationResult = null;

            try
            {
                userDTO.IsActive = false;
                userDeactivationResult = _userService.UpdateItem(userDTO);

                if(userDeactivationResult is UserSuccessResult)
                {
                    //Deactivate any/all accounts for this user.
                    _accountService.DeactivateAllAccounts(userDTO.Id);
                }
            }
            catch(Exception e)
            {
                userDeactivationResult = new UserFailureResult();
                userDeactivationResult.AddData(string.Format("Error occurred while deactivating user: {0}.", e.Message));
            }

            return userDeactivationResult;
        }

        public IUserResult CreateUserAndAccount(IUser userDTO, IAccount accountDTO)
        {
            IUserResult userCreateResult = null;

            try
            {
                if (_userService.EmailExists(userDTO.Email))
                {
                    //Can't create an account with the same email address.
                    userCreateResult = new UserFailureResult();
                    userCreateResult.AddData(string.Format("Email address '{0}' already exists.", userDTO.Email));
                }
                else
                {
                    userCreateResult = _userService.CreateItem(userDTO);

                    if (userCreateResult is UserSuccessResult)
                    {
                        accountDTO.UserId = userCreateResult.Item.Id;

                        if (string.IsNullOrEmpty(accountDTO.Name)) accountDTO.Name = "My Account";

                        var accountCreateResult = _accountService.CreateItem(accountDTO);

                        if (accountCreateResult is AccountSuccessResult)
                        {
                            Commit();
                        }
                    }
                }
            }
            catch(Exception e)
            {
                Rollback();
                userCreateResult = new UserFailureResult();
                userCreateResult.AddData(string.Format("Error occcured while attempting to create a new user/account: {0}.", e.Message));
            }

            return userCreateResult;
        }

        public IAccountResult GetAccountForUser(IUser user)
        {
            var accountInfo = _accountService.GetItems(a => a.UserId == user.Id)
                .Where(r => r is AccountSuccessResult)
                .FirstOrDefault();

            if(accountInfo != null)
            {
                return accountInfo;
            }
            else
            {
                return new AccountNotFoundResult();
            }
        }
    }
}
