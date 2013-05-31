using System;
using System.Collections.Generic;
using Aachen.Core.Base;

namespace Aachen.Core.Model
{
    public class Category : Entity<byte>
    {
		public string Name { get; set; }
		public string Words { get; set; }
    }
}
