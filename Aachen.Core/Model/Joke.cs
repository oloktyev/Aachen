using System;
using Aachen.Core.Base;

namespace Aachen.Core.Model
{
    public class Joke : Entity<long>
    {
        public string Description { get; set; }
        public DateTime CreatedDate { get; set; }
        public virtual Resource Resource { get; set; }
        public int Rating { get; set; }
    }
}
