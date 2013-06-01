using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Aachen.Core.Model;

namespace Aachen.Core.DTO
{
    public class CategoriesDTO
    {
        public byte CategoryId { get; set; }
        public string CategoryName { get; set; }
        public int Count { get; set; }
    }

}
