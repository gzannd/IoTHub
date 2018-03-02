using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Common.Interfaces.Data
{
    public interface ICommittable
    {
        IDbTransaction Transaction { get; }
        void Commit();
        void Rollback();
    }
}
