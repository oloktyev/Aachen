using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Aachen.Infrastructure.ResourceProcessingRules
{
    public interface IResourceProcessingRule
    {
        string Apply(string item, string argument);
    }
}
