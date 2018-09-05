using Common.Interfaces.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Common.Interfaces.Repository
{
    public abstract class TransactionBase:ICommittable
    {
        protected IDbTransaction Transaction { get; private set; }

        public void Commit()
        {
            if (Transaction != null)
            {
                try
                {
                    Transaction.Commit();
                    Transaction = null;
                }
                catch (InvalidOperationException)
                { }
            }
        }

        public void Rollback()
        {
            if (Transaction != null)
            {
                try
                {
                    Transaction.Rollback();
                    Transaction = null;
                }
                catch (InvalidOperationException)
                { }
            }
        }

        public bool UseTransaction
        {
            get;set;
        }

        IDbTransaction ICommittable.Transaction => throw new NotImplementedException();
    }
}
