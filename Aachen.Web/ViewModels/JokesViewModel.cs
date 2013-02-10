using System;
using System.Collections.Generic;

namespace Aachen.Web.ViewModels
{
    public class JokesViewModel
    {
        public IList<JokeViewModel> Jokes { get; set; }
        public int PageCount { get; set; }
        public int SelectedPage { get; set; }
    }

    public class JokeViewModel
    {
        public string Description { get; set; }
        public DateTime CreatedDate { get; set; }
        public string WebResourceUrl { get; set; }
    }
}