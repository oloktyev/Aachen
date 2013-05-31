using System;
using log4net;

namespace Aachen.Infrastructure.Logging
{
    public class Log4NetLogger : ILogger
    {
		private readonly ILog _logger = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        public void Info(string message)
        {
            _logger.Info(message);
        }

        public void Error(string message)
        {
            _logger.Error(message);
        }

        public void ErrorException(string message, Exception exception)
        {
            _logger.Fatal(message, exception);
        }
    }
}