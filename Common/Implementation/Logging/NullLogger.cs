using Common.Interfaces.Logging;
using System;
using System.Collections.Generic;
using System.Text;

namespace Common.Implementation.Logging
{
    public class NullLogger : ILogger
    {
        public void Log(Exception e)
        {
            Console.WriteLine("Exception " + e.Message);
        }

        public void Log(string message)
        {
            Console.WriteLine("Message: " + message);
        }

        public void Log(string message, object data)
        {
            Console.WriteLine("Message: " + message + " " + Convert.ToString(data));
        }
    }
}
