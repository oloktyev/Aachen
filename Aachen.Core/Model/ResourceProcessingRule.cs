using Aachen.Core.Base;

namespace Aachen.Core.Model
{
    public class ResourceProcessingRule : Entity<int>
    {
        public string Rule { get; set; }
        public string Argument { get; set; }
        public virtual Resource Resource { get; set; }
        public virtual bool Active { get; set; }
    }
}
