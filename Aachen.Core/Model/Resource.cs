using System.Collections.Generic;
using Aachen.Core.Base;

namespace Aachen.Core.Model
{
    public class Resource : Entity<int>
    {
        public string Name { get; set; }
        public string Url { get; set; }
        public virtual ResourceType Type { get; set; }
		public virtual bool Active { get; set; }
		public virtual IList<ResourceProcessingRule> Rules { get; set; }
    }
}
