using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Common.Interfaces.Repository
{
    public interface IConnectionFactory
    {
        IDbConnection GetConnection(string connectionString = null);

    }
}
