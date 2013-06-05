using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml;
using Aachen.Infrastructure.Logging;

namespace Aachen.Infrastructure.Parsers
{
    public class RssParser : FeedParserBase
    {
        private static readonly ILogger _logger = new Log4NetLogger();

        #region IFeedParser Members

        public override List<string> Parse(string url)
        {
            var xDcoument = new XmlDocument();
            var results = new List<string>();
            try
            {
                xDcoument.Load(url);
                if (xDcoument.DocumentElement != null)
                {
                    var descriptionNodes = xDcoument.DocumentElement.SelectNodes("channel/item/description").Cast<XmlNode>();
                    results = descriptionNodes.Select(x => x.InnerText.Trim().Replace(@"<p>", "").Replace(@"</p>", "")).ToList();
                }
				foreach(var tag in dangerousTags)
					foreach(var result in results)
						if(result.ToUpper().Contains(tag.ToUpper()))
						{
							_logger.Info(string.Format("Removing joke {0}./n Dangerous tag: {1}", result, tag));
							results.Remove(result);
						}
            }
            catch(Exception ex)
            {
                _logger.ErrorException(string.Format("Failed to parse resource: {0}", url), ex);
            }
            return results;
        }

        #endregion
    }
}
