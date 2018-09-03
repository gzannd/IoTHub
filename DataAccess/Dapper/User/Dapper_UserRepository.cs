using Common;
using Common.Implementation.User;
using Common.Interfaces.Data;
using Common.Interfaces.Repository;
using Common.Interfaces.User;
using Dapper;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace DataAccess.Dapper.User
{

    public class Dapper_UserRepository : BaseRepository,
        Microsoft.AspNetCore.Identity.IUserStore<IoTHubUserIdentity>, 
        IUserLoginStore<IoTHubUserIdentity>, 
        IUserEmailStore<IoTHubUserIdentity>,
        IUserPasswordStore<IoTHubUserIdentity>, 
        IUserSecurityStampStore<IoTHubUserIdentity>,
        ICommittable
    {
        public IDbTransaction Transaction => throw new NotImplementedException();

        /// <summary>
        /// User Repository constructor passing injected connection factory to the Base Repository
        /// </summary>
        /// <param name="connectionFactory">The injected connection factory.  It is injected with the constructor argument that is the connection string.</param>
        public Dapper_UserRepository(IConnectionFactory connectionFactory) : base(connectionFactory)
        {
        }

        /// <summary>
        /// INSERT operation for a new user.
        /// </summary>
        /// <param name="user">The User object must be passed in.  We create this during the Register Action.</param>
        /// <returns>Returns a 0 or 1 depending on whether operation is successful or not.</returns>
        public async Task<int> CreateAsync(IoTHubUserIdentity user)
        {
            var returnValue = WithConnection<int>(async connection =>
            {
                string query = "INSERT INTO Users" +
                "(FirstName, LastName, Email, PhoneNumber, PasswordHash,SecurityStamp,DateCreated) " +
                "VALUES(@Firstname,@LastName,@Email,@PhoneNumber,@PasswordHash,@SecurityStamp,@DateCreated);" +
                "SELECT CAST(SCOPE_IDENTITY() AS INT)";

                var temp = connection.Query<int>(query, user).Single();
                user.Id = Convert.ToString(temp);

                return temp;
            }).Result;

            return returnValue;
        }

        /// <summary>
        /// DELETE operation for a user.  This is not currently used, but required by .NET Identity.
        /// </summary>
        /// <param name="user">The User object</param>
        /// <returns>Returns a 0 or 1 depending on whether operation is successful or not.</returns>
        public async Task DeleteAsync(IoTHubUserIdentity user)
        {
            await WithConnection(async connection =>
            {
                string query = "DELETE FROM Users WHERE UserId=@UserId";
                return await connection.ExecuteAsync(query, new { @UserId = user.Id });
            });
        }

        /// <summary>
        /// SELECT operation for finding a user by the Id value.  Our Id is currently a GUID but this can be another data type as well.
        /// </summary>
        /// <param name="userId">The Id of the user object.</param>
        /// <returns>Returns the User object for the supplied Id or null.</returns>
        public async Task<IoTHubUserIdentity> FindByIdAsync(string userId)
        {
            return await WithConnection(async connection =>
            {
                string query = "SELECT * FROM Users WHERE UserId=@UserId";
                var user = await connection.QueryAsync<IoTHubUserIdentity>(query, new { @UserId = userId });
                if(user.Count() > 0)
                {
                    user.First().Id = userId;
                }

                return user.FirstOrDefault();
            });
        }

        /// <summary>
        /// SELECT operation for finding a user by the username.
        /// </summary>
        /// <param name="userName">The username of the user object.</param>
        /// <returns>Returns the User object for the supplied username or null.</returns>
        public async Task<IoTHubUserIdentity> FindByNameAsync(string userName)
        {
            return await WithConnection(async connection =>
            {
                string query = "SELECT * FROM Users WHERE LOWER(Email)=LOWER(@Email)";
                var user = await connection.QueryAsync<IoTHubUserIdentity>(query, new { @Email = userName });
                
                return user.FirstOrDefault();
            });
        }

        /// <summary>
        /// UPDATE operation for updating a user.
        /// </summary>
        /// <param name="user">The user that will be updated.  The updated values must be passed in to this method.</param>
        /// <returns>Returns a 0 or 1 depending on whether operation is successful or not.</returns>
        public async Task UpdateAsync(IoTHubUserIdentity user)
        {
            await WithConnection(async connection =>
            {
                string query =
                    "UPDATE Users " +
                    "SET UserName=@Email," +
                    "FirstName=@FirstName," +
                    "LastName=@LastName," + 
                    "PhoneNumber=@PhoneNumber," +
                    "Email=@Email," +
                    "PasswordHash=@PasswordHash," +
                    "SecurityStamp=@SecurityStamp," +
                    "DateCreated=@CreatedDate," +
                    "DateUpdated=" + DateTime.Now.ToString() +
                    " WHERE UserId=@UserId";
                return await connection.ExecuteAsync(query, user);
            });
        }

        /// <summary>
        /// INSERT operation for adding an external login such as Google for a new or existing account.
        /// </summary>
        /// <param name="user">The User object that will be associated with the external login information.</param>
        /// <param name="login">The user login information.  This object is constructed during the callback from the external authority.</param>
        /// <returns>Returns a 0 or 1 depending on whether operation is successful or not.</returns>
        public async Task AddLoginAsync(IoTHubUserIdentity user, UserLoginInfo login)
        {
            await WithConnection(async connection =>
            {
                string query =
                    "INSERT INTO ExternalLogins(ExternalLoginId, UserId, LoginProvider, ProviderKey) VALUES(@externalLoginId, @userId, @loginProvider, @providerKey)";
                return
                    await
                        connection.ExecuteAsync(query,
                            new
                            {
                                externalLoginId = Guid.NewGuid(),
                                userId = user.Id,
                                loginProvider = login.LoginProvider,
                                providerKey = login.ProviderKey
                            });
            });
        }

        /// <summary>
        /// DELETE operation for removing an external login from an existing user account.
        /// </summary>
        /// <param name="user">The user object that the external login will be removed from.</param>
        /// <param name="login">The external login that will be removed from the user account.</param>
        /// <returns>Returns a 0 or 1 depending on whether operation is successful or not.</returns>
        public async Task RemoveLoginAsync(IoTHubUserIdentity user, UserLoginInfo login)
        {
            await WithConnection(async connection =>
            {
                string query = "DELETE FROM ExternalLogins WHERE Id = @Id AND LoginProvider = @loginProvider AND ProviderKey = @providerKey";
                return await connection.ExecuteAsync(query, new { user.Id, login.LoginProvider, login.ProviderKey });
            });
        }

        /// <summary>
        /// SELECT operation for getting external logins for a user account.
        /// </summary>
        /// <param name="user">The user account to get external login information for.</param>
        /// <returns>List of UserLoginInfo objects that contain external login information for each associated external account.</returns>
        public async Task<IList<UserLoginInfo>> GetLoginsAsync(IoTHubUserIdentity user)
        {
            return await WithConnection(async connection =>
            {

                string query = "SELECT LoginProvider, ProviderKey FROM ExternalLogins WHERE UserId = @Id";
                var loginInfo = await connection.QueryAsync<UserLoginInfo>(query, user);
                return loginInfo.ToList();
            });
        }

        /// <summary>
        /// SELECT operation for getting the user object associated with a specific external login
        /// </summary>
        /// <param name="login">The external account</param>
        /// <returns>The User associated with the external account or null</returns>
        public async Task<IoTHubUserIdentity> FindAsync(UserLoginInfo login)
        {
            await WithConnection(async connection =>
            {
                string query =
                    "SELECT u.* FROM Users u INNER JOIN ExternalLogins e ON e.UserId = u.Id WHERE e.LoginProvider = @loginProvider and e.ProviderKey = @providerKey";
                var account = await connection.QueryAsync<IoTHubUserIdentity>(query, login);
                return account.SingleOrDefault();
            });
            return null;
        }

        /// <summary>
        /// Method for setting the password hash for the user account.  This hash is used to encode the users password.
        /// </summary>
        /// <param name="user">The user to has the password for.</param>
        /// <param name="passwordHash">The password has to use.</param>
        /// <returns></returns>
        public Task SetPasswordHashAsync(IoTHubUserIdentity user, string passwordHash)
        {
            if (user == null)
            {
                throw new ArgumentNullException(nameof(user));
            }
            user.PasswordHash = passwordHash;
            return Task.FromResult(0);
        }

        /// <summary>
        /// Method for getting teh password hash for the user account.
        /// </summary>
        /// <param name="user">The user to get the password hash for.</param>
        /// <returns>The password hash.</returns>
        public Task<string> GetPasswordHashAsync(IoTHubUserIdentity user)
        {
            if (user == null)
            {
                throw new ArgumentNullException(nameof(user));
            }
            return Task.FromResult(user.PasswordHash);
        }

        /// <summary>
        /// Method for checking if an account has a password hash.
        /// </summary>
        /// <param name="user">The user to check for an existing password hash.</param>
        /// <returns>True of false depending on whether the password hash exists or not.</returns>
        public Task<bool> HasPasswordAsync(IoTHubUserIdentity user)
        {
            return Task.FromResult(!string.IsNullOrEmpty(user.PasswordHash));
        }

        /// <summary>
        /// Method for setting the security stamp for the user account.
        /// </summary>
        /// <param name="user">The user to set the security stamp for.</param>
        /// <param name="stamp">The stamp to set.</param>
        /// <returns></returns>
        public Task SetSecurityStampAsync(IoTHubUserIdentity user, string stamp)
        {
            if (user == null)
            {
                throw new ArgumentNullException(nameof(user));
            }
            user.SecurityStamp = stamp;
            return Task.FromResult(0);
        }

        /// <summary>
        /// Method for getting the security stamp for the user account.
        /// </summary>
        /// <param name="user">The user to get the security stamp for.</param>
        /// <returns>The security stamp.</returns>
        public Task<string> GetSecurityStampAsync(IoTHubUserIdentity user)
        {
            if (user == null)
            {
                throw new ArgumentNullException(nameof(user));
            }
            return Task.FromResult(user.SecurityStamp);
        }

        public void Dispose()
        {
        }

        public bool EmailExists(string email)
        {
            return false;
        }

        /*
        public IUserResult GetItem(string key)
        {
            var result = FindByIdAsync(key);

            if(result != null)
            {
                return new UserSuccessResult
                {
                    Item = new UserDTO
                    {
                        Id = result.Result.Id,
                        Email = result.Result.Email,
                        FirstName = result.Result.FirstName,
                        LastName = result.Result.LastName,
                        IsActive = result.Result.IsActive,
                        PhoneNumber = result.Result.PhoneNumber
                    }
                };
            }
            else
            {
                return new UserFailureResult
                {
                    Data = new List<string> { "Unable to locate user with Id " + key }
                };
            }
        }
        */

            /*
        public IUserResult UpdateItem(Common.Interfaces.User.IUser model)
        {
            try
            {
                UpdateAsync(new IoTHubUserIdentity
                {
                    Id = model.Id,
                    Email = model.Email,
                    FirstName = model.FirstName,
                    LastName = model.LastName,
                    PhoneNumber = model.PhoneNumber,
                    IsActive = model.IsActive
                }).ConfigureAwait(false);

                return new UserSuccessResult();
            }
            catch(Exception e)
            {
                return new UserFailureResult() { Data = new List<string> { e.Message } };
            }
            
        }*/

        public IEnumerable<IUserResult> GetItems(Func<Common.Interfaces.User.IUser, bool> filter = null)
        {
            throw new NotImplementedException();
        }

        /*
        public async Task< IUserResult> CreateItem(Common.Interfaces.User.IUser model)
        {
            try
            {
                await CreateAsync(new IoTHubUserIdentity
                {
                    Email = model.Email,
                    FirstName = model.FirstName,
                    LastName = model.LastName,
                    PhoneNumber = model.PhoneNumber,
                    IsActive = model.IsActive
                });

                 return new UserSuccessResult();
            }
            catch (Exception e)
            {
                return new UserFailureResult() { Data = new List<string> { e.Message } };
            }

        }
        */

            /*
        public IUserResult DeleteItem(Common.Interfaces.User.IUser model)
        {
            DeleteAsync(new IoTHubUserIdentity
            {
                Id = model.Id,
                Email = model.Email,
                FirstName = model.FirstName,
                LastName = model.LastName,
                PhoneNumber = model.PhoneNumber,
                IsActive = model.IsActive
            }).ConfigureAwait(false);

            return new UserSuccessResult();
        }
        */

        public IUserResult DeleteItem(string key)
        {
            throw new NotImplementedException();
        }

        public void Commit()
        {

        }

        public void Rollback()
        {

        }

        public Task<string> GetUserIdAsync(IoTHubUserIdentity user, CancellationToken cancellationToken)
        {
            if (user != null)
            {
                return Task.FromResult(user.Id);
            }
            else
            {
                return Task.FromResult<string>(null);
            }
        }

        public Task<string> GetUserNameAsync(IoTHubUserIdentity user, CancellationToken cancellationToken)
        {
            if (user != null)
            {
                return Task.FromResult(user.UserName);
            }
            else
            {
                return Task.FromResult<string>(null);
            }
        }

        public Task SetUserNameAsync(IoTHubUserIdentity model, string userName, CancellationToken cancellationToken)
        {
            try
            {
                return UpdateAsync(new IoTHubUserIdentity
                {
                    Id = model.Id,
                    Email = model.Email,
                    FirstName = model.FirstName,
                    LastName = model.LastName,
                    PhoneNumber = model.PhoneNumber,
                    IsActive = model.IsActive,
                    UserName = model.Email
                });
            }
            catch (Exception e)
            {
                return Task.FromResult (new UserFailureResult { Data = new List<string> { e.Message } });
            }
        }

        public Task<string> GetNormalizedUserNameAsync(IoTHubUserIdentity user, CancellationToken cancellationToken)
        {
            if (user != null)
            {
                return Task.FromResult(user.UserName);
            }
            else
            {
                return Task.FromResult<string>(null);
            }
        }

        public Task SetNormalizedUserNameAsync(IoTHubUserIdentity user, string normalizedName, CancellationToken cancellationToken)
        {
            user.UserName = normalizedName;
            return Task.CompletedTask;
        }

        public Task<IdentityResult> CreateAsync(IoTHubUserIdentity model, CancellationToken cancellationToken)
        {
            try
            {
                model.DateCreated = DateTime.Now;
                var result = CreateAsync(model);

                if(result.IsCompletedSuccessfully == true)
                {
                    return Task.FromResult(IdentityResult.Success);
                }
                else
                {
                    return Task.FromResult(IdentityResult.Failed());
                }
            }
            catch (Exception e)
            {
                var error = new IdentityError();
                error.Description = e.Message;
                return Task.FromResult<IdentityResult>(IdentityResult.Failed(error)); // UserFailureResult() { Data = new List<string> { e.Message } };
            }
        }

        public Task<IdentityResult> UpdateAsync(IoTHubUserIdentity model, CancellationToken cancellationToken)
        {
            try
            {
                UpdateAsync(new IoTHubUserIdentity
                {
                    Id = model.Id,
                    Email = model.Email,
                    FirstName = model.FirstName,
                    LastName = model.LastName,
                    PhoneNumber = model.PhoneNumber,
                    IsActive = model.IsActive
                }).ConfigureAwait(false);

                return Task.FromResult(IdentityResult.Success);
            }
            catch (Exception e)
            {
                var error = new IdentityError() { Description = e.Message };
                return Task.FromResult(IdentityResult.Failed(error));
            }
        }

        public Task<IdentityResult> DeleteAsync(IoTHubUserIdentity model, CancellationToken cancellationToken)
        {
            DeleteAsync(new IoTHubUserIdentity
            {
                Id = model.Id,
                Email = model.Email,
                FirstName = model.FirstName,
                LastName = model.LastName,
                PhoneNumber = model.PhoneNumber,
                IsActive = model.IsActive
            }).ConfigureAwait(false);

            return Task.FromResult(IdentityResult.Success);
        }

        public Task<IoTHubUserIdentity> FindByIdAsync(string userId, CancellationToken cancellationToken)
        {
            var result = FindByIdAsync(userId);
            return Task.FromResult(result.Result);
        }

        public Task<IoTHubUserIdentity> FindByNameAsync(string normalizedUserName, CancellationToken cancellationToken)
        {
           var result = FindByNameAsync(normalizedUserName);
            if(result.Result == null)
            {
                return Task.FromResult<IoTHubUserIdentity>(null);
            }
            else
            {
                return Task.FromResult(result.Result);
            }
        }

        public Task AddLoginAsync(IoTHubUserIdentity user, UserLoginInfo login, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task RemoveLoginAsync(IoTHubUserIdentity user, string loginProvider, string providerKey, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task<IList<UserLoginInfo>> GetLoginsAsync(IoTHubUserIdentity user, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task<IoTHubUserIdentity> FindByLoginAsync(string loginProvider, string providerKey, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task SetPasswordHashAsync(IoTHubUserIdentity user, string passwordHash, CancellationToken cancellationToken)
        {
            user.PasswordHash = passwordHash;
            return Task.CompletedTask;
        }

        public Task<string> GetPasswordHashAsync(IoTHubUserIdentity user, CancellationToken cancellationToken)
        {
            return Task.FromResult(user.PasswordHash);
        }

        public Task<bool> HasPasswordAsync(IoTHubUserIdentity user, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task SetSecurityStampAsync(IoTHubUserIdentity user, string stamp, CancellationToken cancellationToken)
        {
            user.SecurityStamp = stamp;
            return Task.CompletedTask;
        }

        public Task<string> GetSecurityStampAsync(IoTHubUserIdentity user, CancellationToken cancellationToken)
        {
            return Task.FromResult(user.SecurityStamp);
        }

        public Task SetEmailAsync(IoTHubUserIdentity user, string email, CancellationToken cancellationToken)
        {
            user.Email = email;
            return Task.CompletedTask;
        }

        public Task<string> GetEmailAsync(IoTHubUserIdentity user, CancellationToken cancellationToken)
        {
            return Task.FromResult(user.Email);
        }

        public Task<bool> GetEmailConfirmedAsync(IoTHubUserIdentity user, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task SetEmailConfirmedAsync(IoTHubUserIdentity user, bool confirmed, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task<IoTHubUserIdentity> FindByEmailAsync(string normalizedEmail, CancellationToken cancellationToken)
        {
            return WithConnection(async connection =>
            {
                string query = "SELECT * FROM Users WHERE Email=@Email";
                var user = await connection.QueryAsync<IoTHubUserIdentity>(query, new { @Email = normalizedEmail });
                return user.SingleOrDefault();
            });
        }
    

        public Task<string> GetNormalizedEmailAsync(IoTHubUserIdentity user, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        public Task SetNormalizedEmailAsync(IoTHubUserIdentity user, string normalizedEmail, CancellationToken cancellationToken)
        {
            user.Email = user.UserName;
            return Task.CompletedTask;
        }
    }

    /*
    public class Dapper_UserRepository : IUserRepository,ICommittable
    {
        private IConnectionFactory _connectionFactory;

        public IDbTransaction Transaction => throw new NotImplementedException();

        public Dapper_UserRepository(IConnectionFactory connectionFactory)
        {
            _connectionFactory = connectionFactory;
        }

        public IUserResult CreateItem(IUser model)
        {
            IUserResult userResult;

            var conn = _connectionFactory.GetConnection();
 
                var result = conn.Insert(model);

                if (result > 0)
                {
                    userResult = new UserSuccessResult();
                    userResult.Item = model;
                }
                else
                {
                    userResult = new UserFailureResult();
                }
            
            return userResult;
        }

        public IUserResult DeleteItem(IUser model)
        {
            IUserResult userResult;
            using (var conn = _connectionFactory.GetConnection())
            {
                var result = conn.Delete(model);

                if (result == true)
                {
                    userResult = new UserSuccessResult();
                }
                else
                {
                    userResult = new UserFailureResult();
                }
            }

            return userResult;
        }

        public IUserResult DeleteItem(string key)
        {
            return DeleteItem(new IoTHubUserIdentity { Id = key });
        }

        public IUserResult GetItem(string key)
        {
            IUserResult userResult;
            using (var conn = _connectionFactory.GetConnection())
            {
                var result = conn.Get<IUser>(new IoTHubUserIdentity { Id = key });

                if (result != null)
                {
                    userResult = new UserSuccessResult();
                    userResult.Item = result;
                }
                else
                {
                    userResult = new UserFailureResult();
                    userResult.AddData("Unable to locate user Id " + key);
                }
            }

            return userResult;
        }

        public IEnumerable<IUserResult> GetItems(Func<IUser, bool> filter = null)
        {
            throw new NotImplementedException();
        }

        public bool EmailExists(string email)
        {
            var sql = @"SELECT 1 WHERE EXISTS 
                        (SELECT Email FROM Users
                        WHERE Email = @email)";

            bool exists = false;
            using (var conn = _connectionFactory.GetConnection())
            {
                exists = conn.QuerySingleOrDefault<bool>(sql, new { email = new DbString { Value = email, IsFixedLength = false, Length = email.Length, IsAnsi = true } }, ((ICommittable)_connectionFactory).Transaction);
            }

            return exists;
        }

        public IUserResult UpdateItem(IUser model)
        {
            IUserResult userResult;
            using (var conn = _connectionFactory.GetConnection())
            {
                var result = conn.Update(model);

                if (result == true)
                {
                    userResult = new UserSuccessResult();
                    userResult.Item = model;
                }
                else
                {
                    userResult = new UserFailureResult();
                    userResult.AddData("Unable to update user Id " + model.Id);
                }
            }

            return userResult;
        }

        public void Commit()
        {
            ((ICommittable)_connectionFactory).Commit();
        }

        public void Rollback()
        {
            ((ICommittable)_connectionFactory).Rollback();
        }
    }
    */


}
