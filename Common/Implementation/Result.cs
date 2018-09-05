using Common.Interfaces.Repository;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Implementation
{
    public class Result<T, R> : IResult<T, R>
    {
        public Result()
        {
            Data = new List<R>();
        }

        public Result(R data)
        {
            Data = new List<R>() { data };
        }

        public virtual bool Success { get => throw new NotImplementedException(); }
        public T Item { get; set; }
        public IList<R> Data { get; set; }

        public void AddData(IEnumerable<R> dataList)
        {
           foreach(var item in dataList)
            {
                Data.Add(item);
            }
        }

        public void AddData(R data)
        {
            Data.Add(data);
        }
    }

    public class SuccessResult<T, R> : Result<T, R>
    {
        public override bool Success { get { return true; } }
    }

    public class FailureResult<T, R>: Result<T, R>
    {
        public override bool Success { get { return false; } }
    }
}
