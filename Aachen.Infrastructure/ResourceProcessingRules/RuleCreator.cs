﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Aachen.Core.Base;

namespace Aachen.Infrastructure.ResourceProcessingRules
{
    public class RuleCreator
    {
        public static IResourceProcessingRule GetRule(string rule)
        {
            var ruleEnum = (Enums.ResourceProcessingRule) Enum.Parse(typeof (Enums.ResourceProcessingRule), rule);
            switch (ruleEnum)
            {
                case Enums.ResourceProcessingRule.RemoveFrom:
                    return new RemoveFromRule();
                case Enums.ResourceProcessingRule.Replace:
                    return new ReplaceRule();
				case Enums.ResourceProcessingRule.RemoveBeginning:
					return new RemoveBeginningRule();
				case Enums.ResourceProcessingRule.RemoveEnd:
					return new RemoveEndRule();
                default:
                    throw new NotImplementedException();
            }
        }
    }
}
