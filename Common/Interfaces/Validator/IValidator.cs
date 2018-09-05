using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Interfaces.Validator
{
    public interface IValidator<in T>
    {
        IEnumerable<string> Validate(T subject);
    }
}
