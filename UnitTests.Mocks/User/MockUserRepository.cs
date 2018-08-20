using Common.Implementation.User;
using Common.Interfaces.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UnitTests.Mocks.User
{
    public class MockUserRepository : IUserRepository
    {
        private IList<IUser> users;

        public MockUserRepository()
        {
            users = new List<IUser>();
        }

        public MockUserRepository(IList<IUser> users)
        {
            this.users = users;
        }

        public Task CreateAsync(IUser user)
        {
            throw new NotImplementedException();
        }

        public IUserResult CreateItem(IUser model)
        {
            model.Id = users.Max(u => u.Id) + 1;
            users.Add(model);

            return new UserSuccessResult() { Item = model };
        }

        public IUserResult DeleteItem(IUser model)
        {
            if (model != null)
            {
                users.Remove(users.Where(u => u.Id == model.Id).FirstOrDefault());
            }

            return new UserSuccessResult() { };
        }

        public IUserResult DeleteItem(string key)
        {
            users.Remove(users.Where(u => u.Id == key).FirstOrDefault());

            return new UserSuccessResult() { };
        }

        public bool EmailExists(string email)
        {
            throw new NotImplementedException();
        }

        public IUserResult GetItem(string key)
        {
            var user = users.Where(u => u.Id == key).FirstOrDefault();
            IUserResult result = null;

            if(user != null)
            {
                result = new UserSuccessResult() { Item = user };
            }
            else
            {
                result = new UserFailureResult();
                result.AddData(new List<string> { "Unable to locate user ID " + key });
            }

            return result;
        }

        public IEnumerable<IUserResult> GetItems(Func<IUser, bool> filter = null)
        {
            List<IUser> userList = null;
            IList<IUserResult> results = new List<IUserResult>();

            if (filter != null)
            {
                userList = users.Where(filter).ToList();
            }
            else
            {
                userList = users.ToList();
            }

            if(userList != null)
            {
                foreach(var item in userList)
                {
                    results.Add(new UserSuccessResult() { Item = item });
                }
            }

            return results;
        }

        public IUserResult UpdateItem(IUser model)
        {
            var retrieveResult = GetItem(model.Id);
            IUserResult result = null;

            if(retrieveResult is UserSuccessResult) //Normally you'd use a mapper here.
            {
                retrieveResult.Item.PhoneNumber = model.PhoneNumber;
                retrieveResult.Item.FirstName = model.FirstName;
                retrieveResult.Item.LastName = model.LastName;
                result = new UserSuccessResult() { Item = retrieveResult.Item };
            }
            else
            {
                result = new UserFailureResult();
                ((List<string>)result.Data).Add("Unable to locate user ID " + model.Id);
            }

            return result;
        }
    }
}
