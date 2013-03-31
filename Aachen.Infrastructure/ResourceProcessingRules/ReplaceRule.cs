using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aachen.Infrastructure.ResourceProcessingRules
{
    class ReplaceRule : IResourceProcessingRule
    {
        public string Apply(string item, string argument)
        {
            var args = argument.Split(';');
            item = item.Replace(args[0], args[1]);
            while (item.IndexOf(@"<br><br>", System.StringComparison.Ordinal) >= 0)
                item = item.Replace(@"<br><br>", @"<br>");
            while (item.IndexOf(@"<br> <br>", System.StringComparison.Ordinal) >= 0)
                item = item.Replace(@"<br> <br>", @"<br>");
            return item;
        }
    }
}
