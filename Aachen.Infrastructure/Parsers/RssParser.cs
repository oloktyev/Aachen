using System.Collections.Generic;
using System.Linq;
using System.Xml;

namespace Aachen.Infrastructure.Parsers
{
    public class RssParser : FeedParserBase
    {
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
                    System.Diagnostics.Debug.WriteLine(s);
                    result.Remove(s);
                }
            }
            catch
            {
            }
            return result;
        }

        #endregion
    }
}
