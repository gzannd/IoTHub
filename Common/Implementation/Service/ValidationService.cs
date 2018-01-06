using Common.Interfaces.Validator;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Common.Implementation.Service
{
    public class Validator<T> : Interfaces.Validator.IValidator<T>
    {
        IEnumerable<Interfaces.Validator.IValidator<T>> Validators { get; }

        public Validator(IEnumerable<Interfaces.Validator.IValidator<T>> validators)
        {
            Validators = validators;
        }

        public IEnumerable<string> Validate(T subject) => Validators.SelectMany(v => v.Validate(subject));
    }
}
