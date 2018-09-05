using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Interfaces.UnitOfWork
{
    public interface IUnitOfWork:IDisposable
    {
        void Commit();
        void Rollback();
    }
}
