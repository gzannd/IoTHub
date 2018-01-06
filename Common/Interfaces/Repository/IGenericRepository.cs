using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Interfaces.Repository
{
    public interface IGenericRepository<Model, Key, Result>:
        IReadRepository<Model, Key, Result>, 
        IUpdateRepository<Model, Key, Result>,
        IListReadRepository<Model, Key, Result>, 
        IWriteRepository<Model, Key, Result>, 
        IDeleteRepository<Model, Key, Result>
    {
    }
}
