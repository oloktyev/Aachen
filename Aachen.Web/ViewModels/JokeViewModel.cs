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
        public DateTime CreatedDate { get; set; }
        public string Category { get; set; }
    }

    public class JokeListViewModel
    {
        public IList<JokeViewModel> JokeList { get; set; }
        public int First { get; set; }
    }

    public class FeaturedJokeViewModel
    {
        public IList<long> Jokes { get; set; }
        public int First { get; set; }
    }
}