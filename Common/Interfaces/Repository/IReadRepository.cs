using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Interfaces.Repository
{
    public interface IReadRepository<Model, Key, Result>
    {
        Result GetItem(Key key);
    }

    public interface IListReadRepository<Model, Key, Result>
    {
        IEnumerable<Result> GetItems(Func<Model, bool> filter = null);
    }

    public interface IWriteRepository<Model, Key, Result>
    {
        Result CreateItem(Model model);
    }

    public interface IUpdateRepository<Model, Key, Result>
    {
        Result UpdateItem(Model model);
    }

    public interface IDeleteRepository<Model, Key, Result>
    {
        Result DeleteItem(Model model);
        Result DeleteItem(Key key);
    }
}
