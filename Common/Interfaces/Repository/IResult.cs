using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Interfaces.Repository
{
    public interface IResult<T, R>
    {
        T Item { get; set; }
        IList<R> Data { get; set; }
        void AddData(R data);
    }
}
