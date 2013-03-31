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
            return item.Replace(args[0], args[1]);
        }
    }
}
