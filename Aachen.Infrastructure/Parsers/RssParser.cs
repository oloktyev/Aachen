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
            var result = new List<string>();
            try
            {
                xDcoument.Load(url);
                if (xDcoument.DocumentElement != null)
                {
                    var descriptionNodes = xDcoument.DocumentElement.SelectNodes("channel/item/description").Cast<XmlNode>();
                    result = descriptionNodes.Select(x => x.InnerText.Trim().Replace(@"<p>", "").Replace(@"</p>", "")).ToList();
                }
                foreach (var s in from tag in dangerousTags from s in result where s.ToUpper().Contains(tag.ToUpper()) select s)
                {
                    result.Remove(s);
                }
            }
            catch(Exception ex)
            {
                _logger.ErrorException("Failed to parse resource.", ex);
            }
            return result;
        }

        #endregion
    }
}
