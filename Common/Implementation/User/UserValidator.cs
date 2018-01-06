using Common.Interfaces.User;
using Common.Interfaces.Validator;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Implementation.User
{
    public class UserValidator : IValidator<IUser>
    {
        public IEnumerable<string> Validate(IUser item)
        {
            return ValidateItem(item);
        }

        private IList<string>ValidateItem(IUser item)
        {
            var validationErrors = new List<string>();

            if(item != null)
            {
                if (string.IsNullOrEmpty(item.FirstName)) validationErrors.Add("First Name cannot be null.");
                if (string.IsNullOrEmpty(item.LastName)) validationErrors.Add("Last Name cannot be null.");
                if (string.IsNullOrEmpty(item.PhoneNumber)) validationErrors.Add("Phone number cannot be null.");
            }
            else
            {
                validationErrors.Add("User is NULL.");
            }

            return validationErrors;
        }
    }
}
