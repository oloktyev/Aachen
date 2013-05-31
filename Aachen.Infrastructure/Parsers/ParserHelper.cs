using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Aachen.Core.Base;
using Aachen.Core.Model;
using Aachen.Infrastructure.ResourceProcessingRules;

namespace Aachen.Infrastructure.Parsers
{
    public static class ParserHelper
    {
        public static IList<string> ParseResourse(byte typeId, string url)
        {

            var parser = FeedParserBase.GetParser((Enums.ResourceType)typeId);
            var result = parser.Parse(url);
            return result;
        }

        public static IList<string> ApplyRules(this IList<string> jokes, IList<ResourceProcessingRule> rules)
        {
            if (rules == null)
                return jokes;

            for (var i = 0; i < jokes.Count; i++)
                foreach (var rule in rules)
                    jokes[i] = RuleCreator.GetRule(rule.Rule)
                        .Apply(jokes[i], rule.Argument);
            return jokes;
        }

        public static IList<string> RemoveOldJokes(this IList<string> jokes, string lastJoke)
        {
            return lastJoke == null || !jokes.Contains(lastJoke) ? jokes : null;
        }

        public static IList<Joke> CreateJokes(this IList<string> jokes, Resource resource)
        {
            if (jokes == null) 
                return new List<Joke>();

            return jokes.Where(x => !string.IsNullOrEmpty(x)).Select(x => new Joke
                {
                    Description = x, 
                    Resource = resource, 
                    CreatedDate = DateTime.Now
                }).ToList();
        }

		public static IList<Joke> AddCategories(this IList<Joke> jokes, IList<Category> categories)
		{
			foreach(var joke in jokes)
			{
				var jokeCategory = string.Empty;
				foreach (var words in categories.Select(category => category.Words.Split(';')))
				{
					foreach (var word in words)
					{
						if (joke.Description.Contains(word))
						{
							jokeCategory += string.Format(";{0}", word);
							break;
						}
					}
				}
				joke.Categories = jokeCategory.Remove(1, 1);
			}
			return jokes;
		}
    }
}
