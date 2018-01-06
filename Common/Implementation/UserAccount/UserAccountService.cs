using Common.Implementation.Account;
using Common.Implementation.Service;
using Common.Implementation.User;
using Common.Interfaces.Account;
using Common.Interfaces.Logging;
using Common.Interfaces.Repository;
using Common.Interfaces.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Common.Implementation.UserAccount
{
    public class UserAccountService:AccountService
    {
        private IUserService _userService;

        public UserAccountService(IAccountRepository repository, IUserService userService, Validator<IAccount> accountValidator, ILogger logger):base(repository, accountValidator, logger)
        {
            _userService = userService;
        }

        public IAccountResult GetAccountForUser(IUser user)
        {
            var accountInfo = GetItems(a => a.UserId == user.Id)
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

        public IAccountResult CreateAccountForUser(IUser user, IAccount accountDTO)
        {
            IAccountResult result;

            //Confirm that the user exists and has rights to create an account.
            var findUserResult = _userService.GetItem(user.Id);
            if(findUserResult is UserFailureResult)
            {
                result = new AccountFailureResult();
                ((List<string>)result.Data).AddRange((List<string>)findUserResult.Data);
            }
            else if(findUserResult.Item.IsActive == false)
            {
                result = new AccountFailureResult();
                result.AddData("Cannot create account because user is not active.");
            }
            else {
                //Check to see if an account already exists for this user. 
                if(GetAccountForUser(user) is AccountNotFoundResult)
                {
                    //Validate the account settings.
                    var validationResult = _validator.Validate(accountDTO);

                    if (((List<string>)validationResult).Count > 0)
                    {
                        result = new AccountFailureResult() { Data = (List<string>)validationResult };
                    }
                    else
                    {
                        //Create the account.
                        result = CreateItem(accountDTO);
                    }
                }
                else
                { 
                    //Account already exists.
                    result = new AccountFailureResult();
                    result.AddData("User account already exists.");
                }
            }

            return result;
        }
    }
}
