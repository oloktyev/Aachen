﻿using System;
using System.Collections.Generic;
using Aachen.Core.Base;

namespace Aachen.Infrastructure.Parsers
{
    public abstract class FeedParserBase
    {
        protected IList<string> dangerousTags = new List<string>
                                                            {
                                                                @"<FORM",
                                                                @"<A",
                                                                @"<IMG",
                                                                @"<NOFRAMES",
                                                                @"<NOSCRIPT",
                                                                @"<MARQUEE",
                                                                @"<PLAINTEXT",
                                                                @"<REPLACE",
                                                                @"<STYLE",
                                                                @"<BUTTON",
                                                                @"<INPUT",
                                                                @"<TEXTAREA",
                                                                @"<SELECT",
                                                                @"<BLINK",
                                                                @"<XML",
                                                                @"<BASE",
                                                                @"<HTML",
                                                                @"<HEAD",
                                                                @"<TITLE",
                                                                @"<BODY",
                                                                @"<APPLET",
                                                                @"<SCRIPT",
                                                                @"<OBJECT",
                                                                @"<EMBED",
                                                                @"<IFRAME",
                                                                @"<FRAME",
                                                                @"<LAYER",
                                                                @"<ILAYER",
                                                                @"<META",
                                                                @"<BGSOUND",
                                                                @"<LINK",
                                                                @"<ISINDEX",
                                                                @"<NEXTID",
                                                                @"DYNSRC",
                                                                @"LOWSRC",
                                                                @"DATASRC",
                                                                @"BACKGROUND",
                                                                @"STYLE",
                                                                @"SRC",
                                                                @"DATA",
                                                                @"HREF",
                                                                @"onclick",
                                                                @"ondblclick",
                                                                @"onmousedown",
                                                                @"onmousemove",
                                                                @"onmouseover",
                                                                @"onmouseout",
                                                                @"onmouseup",
                                                                @"onkeydown",
                                                                @"onkeypress",
                                                                @"onkeyup",
                                                                @"onchange",
                                                                @"onsubmit",
                                                                @"onreset",
                                                                @"onselect",
                                                                @"onblur",
                                                                @"onfocus",
                                                                @"onload",
                                                                @"onunload",
                                                                @"<IMG"
                                                            };

        public abstract List<string> Parse(string url);

        public static FeedParserBase GetParser(Enums.ResourceType webResourceType)
        {
            switch (webResourceType)
            {
                case Enums.ResourceType.RSS:
                    return new RssParser();
                default:
                    throw new NotImplementedException();
            }
        }
    }
}
