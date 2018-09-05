using Common.Interfaces.User;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Interfaces.Logging
{ 
    public interface ILogger
    {
        void Log(Exception e);
        void Log(string message);
        void Log(string message, object data);
    }
}
