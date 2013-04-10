using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Aachen.Web.ViewModels
{
    public class JokeViewModel
    {
        public long Id { get; set; }
        public string Description { get; set; }
        public string ResourceName { get; set; }
        public string ResourceUrl { get; set; }
        public int Rating { get; set; }
    }
}