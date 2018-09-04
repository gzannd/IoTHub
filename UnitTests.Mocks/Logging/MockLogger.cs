using Common.Interfaces.Logging;
using System;
using System.Collections.Generic;
using System.Text;

namespace UnitTests.Mocks.Logging
{
    public class MockLogger : ILogger
    {
        public void Log(Exception e)
        {
        }

        public void Log(string message)
        {
        }

        public void Log(string message, object data)
        {
        }
    }
}
