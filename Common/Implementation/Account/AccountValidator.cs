using Common.Implementation.Service;
using Common.Interfaces.Account;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Implementation.Account
{
    public class AccountValidator: Common.Interfaces.Validator.IValidator<IAccount>
    {
        public IEnumerable<string> Validate(IAccount item)
        {
            return ValidateItem(item);
        }

        private IList<string> ValidateItem(IAccount item)
        {
            var validationErrors = new List<string>();

            if (item != null)
            {
                if (string.IsNullOrEmpty(item.Name)) validationErrors.Add("Account Name cannot be null.");
                if (item.UserId == 0) validationErrors.Add("User ID cannot be zero.");
            }
            else
            {
                validationErrors.Add("Account is NULL.");
            }

            return validationErrors;
        }
    }
}
