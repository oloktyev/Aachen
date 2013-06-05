using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aachen.Infrastructure.ResourceProcessingRules
{
    class RemoveEndRule : IResourceProcessingRule
    {
        public string Apply(string item, string argument)
        {
			return item.EndsWith(argument)
				? item.Remove(item.Length - argument.Length, argument.Length)
                : item;
        }
    }
}
