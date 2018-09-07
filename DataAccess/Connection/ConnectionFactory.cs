using Common.Interfaces.Data;
using Common.Interfaces.Repository;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Transactions;

namespace DataAccess.Connection
{
    public class ConnectionFactory : IConnectionFactory, ICommittable
    {
        private string _defaultConnectionString;
        private IDbConnection _connection;

        public ConnectionFactory(string defaultConnectionString)
        {
            _defaultConnectionString = defaultConnectionString;
        }

        public IDbTransaction Transaction { get; set; }

        public void Rollback()
        {
            if (Transaction != null)
            {
                try
                {
                    Transaction.Rollback();
                }
                catch (InvalidOperationException)
                { }
                catch (Exception)
                {
                    throw;
                }
            }
        }
        public void Commit()
        {
            if(Transaction != null)
            {
                try
                {
                    Transaction.Commit();
                }
                catch(InvalidOperationException)
                { }
                catch(Exception)
                {
                    throw;
                }
            }
        }

        public IDbConnection GetConnection(string connectionString = null)
        {
            if (_connection == null || _connection.State == ConnectionState.Closed)
            {
                _connection = new SqlConnection(string.IsNullOrEmpty(connectionString) ? _defaultConnectionString : connectionString);
            }

            //if (_connection.State == ConnectionState.Closed) _connection.Open();

           // if(Transaction == null) Transaction  = _connection.BeginTransaction();
            
                return _connection;
        }
    }
}
