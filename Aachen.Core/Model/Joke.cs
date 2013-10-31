using System;
using System.Text.RegularExpressions;
using Aachen.Core.Base;
using System.Collections.Generic;

namespace Aachen.Core.Model
{
    public class Joke : Entity<long>
    {
        public string Description { get; set; }
        public DateTime CreatedDate { get; set; }
        public virtual Resource Resource { get; set; }
		public int Rating { get; set; }
		public string Categories { get; set; }

        public int? Hash {
            /*
            get
            {
                const string regex = @"[^А-Яа-я]+";
                var hash = Regex.Replace(Description, regex, "");
                return hash.GetHashCode();
            }
            set { }
            */
            get; set;
        }

        public override int GetHashCode()
        {
            const string regex = @"[^А-Яа-я]+";
            return Regex.Replace(Description, regex, "").GetHashCode();
        }
    }
}
