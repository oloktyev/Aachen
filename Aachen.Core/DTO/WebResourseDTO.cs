using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Aachen.Core.Model;

namespace Aachen.Core.DTO
{
    public class WebResourseDTO
    {
        public int TypeId { get; set; }
        public IList<ResourceProcessingRule> Rules { get; set; }
    }

}
