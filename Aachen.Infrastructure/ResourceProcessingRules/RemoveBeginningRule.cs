using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aachen.Infrastructure.ResourceProcessingRules
{
    class RemoveBeginningRule : IResourceProcessingRule
    {
        public string Apply(string item, string argument)
        {
			return item.StartsWith(argument)
				? item.Remove(0, argument.Length)
                : item;
        }
    }
}
