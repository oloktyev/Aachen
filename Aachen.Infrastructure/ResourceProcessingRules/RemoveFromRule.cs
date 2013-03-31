using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aachen.Infrastructure.ResourceProcessingRules
{
    class RemoveFromRule : IResourceProcessingRule
    {
        public string Apply(string item, string argument)
        {
            var startIndex = item.IndexOf(argument, StringComparison.Ordinal);
            return startIndex >= 0
                ? item.Remove(startIndex)
                : item;
        }
    }
}
