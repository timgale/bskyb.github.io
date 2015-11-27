---
layout: post
title: "Adam Tornhill - Code as a Crime Scene workshop"
author: "Will Ellis (Head of Software Engineering - BSS)"
date: 2015-06-17 13:36:00
categories: conferences
image: /images/blogs/crime-scene/adam-tornhill.jpg
excerpt: "Adam Tornhill came to Sky on 14th July 2015 to help the BSS Transformation team understand how they could apply his techniques from forensic science to analysing the BSS code-base"
---

I first saw [Adam Tornhill](http://adamtornhill.com/) speak at [QCon London 2015](http://www.infoq.com/conferences/qconlondon2015) back in March and was fascinated by his idea to apply techniques from forensic science to the discipline of software engineering, specifically targeting technical analysis of legacy systems. As someone who has recently taken on responsibility for a massive and complex application in the form of Sky's BSS (Broadcast Support System), I saw huge potential in the techniques and wanted to learn more about how we could apply them here. So, I bought the [book](https://pragprog.com/book/atcrime/your-code-as-a-crime-scene) (also available on [amazon.co.uk](http://www.amazon.co.uk/dp/1680500384)) and started to look into it in a bit more detail.

The [tooling](https://github.com/adamtornhill/code-maat) relies on your application's version control history as its source of data and my first hurdle was that it doesn't support [TFS](https://en.wikipedia.org/wiki/Team_Foundation_Server) (well [TFVC](https://msdn.microsoft.com/en-us/library/ms181237.aspx) to be more specific) yet (yes, yes, we know!), so I dropped him an email to find out whether there would be much work to port it. Mark Lowe (one of our Solution Architects) and I ended up meeting up with Adam in our [Victoria office](http://www.workforsky.com/victoria) to chat in a bit more detail about our challenges and how Adam might be able to help. The trail went a bit cold for a couple of months after that, while we worked hard on our proposal for a major overhaul of the BSS application (now known as the BSS Transformation project). Then finally, this Tuesday, we managed to get Adam in for a 1-day workshop, which was an incredibly valuable experience.

He covered a number of areas, getting us to try out the tooling and analyse the results using a variety of well known code-bases as examples, such as [Mono](https://github.com/mono), [Asp.net MVC](https://github.com/aspnet/Mvc), the [Roslyn compiler](https://github.com/dotnet/roslyn), [his own tools](https://github.com/adamtornhill/code-maat) and last, but not least, BSS itself (as he'd hacked together a pretty good TFS log parser in preparation, see experimental fork on [GitHub](https://github.com/Raystlin99/code-maat)). If you want a good primer to the material, I'd recommend watching one of the various videos available online. This one is the presentation I went to in March: [infoq.com](http://www.infoq.com/presentations/code-bugs-legacy-pitfalls)

I'll do my best to summarise a few of the key techniques, to give a flavour of the content...

### Hotspots

Based on [Dragnet analysis](http://www.ia-ip.org/library/software/dragnet.html) from forensic science, Adam used the example of profiling [Jack the Ripper](https://en.wikipedia.org/wiki/Jack_the_Ripper) to explain this technique, which visualises code "hotspots", where a hotspot is defined as complex code that changes frequently

![Hotspot1](/images/blogs/crime-scene/hotspot1.png)

I shan't go into the gory details of how the version control history is parsed to build up this data, but essentially it combines the number of lines of code for a file with the number of revisions in a given time window to build up a picture of where the potential problems might lie. N.B. It turns out that [LoC](https://en.wikipedia.org/wiki/Source_lines_of_code) is a surprisingly good indicator of complexity if you only need a rough measure.
The key take-home for why this analysis is so important is in the following observation Adam made in his first use of the technique when observed alongside defect analysis: _"72% of all defects were found in 4% of the code"_. He's found a very similar profile in many legacy systems he's since analysed.
Once the data has been mined, Adam uses a variety of visualisation methods, mostly relying on the [d3 JS library](http://d3js.org/). Here's an example view, showing a hotspot in Microsoft's Roslyn compiler:

![Hotspot2](/images/blogs/crime-scene/hotspot2.png)

### Temporal Coupling

The theory behind this analysis technique is that there are inter-dependencies hiding in your code-base that may imply potential quality or even architectural issues. Analysing the profile of commits over a period of time to see whether particular combinations of files are always committed at the same time, or within a short time window can bring these dependencies to the surface.

Interestingly, Adam suggested that some modern layered architectures (e.g. [MVC](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller)/[MVVM](https://en.wikipedia.org/wiki/Model_View_ViewModel)) can be particularly prone to this sort of temporal coupling if not implemented carefully and recommends the use of architectures that are optimised for the type of change you're expecting.

Another culprit for temporal coupling is badly written automated test code. This technique can pin-point places where copy-paste development techniques create significant technical debt in automation test code. Another view on this is the rate of change of automated test code vs. application code, which can highlight a growing problem:

![Temporal Coupling](/images/blogs/crime-scene/temporal-coupling.png)

### Communication Paths

An excellent output of Adam's tools is data that shows up implied communication paths between individuals. If two people have worked on the same piece of code in a given time frame, then this is a form of communication. This can be used to assess how good a fit your current organisation and your code-base are, based on [Conway's law](https://en.wikipedia.org/wiki/Conway%27s_law) (_organizations which design systems ... are constrained to produce designs which are copies of the communication structures of these organizations_). The following diagrams show a couple of possibilities for what the communication paths for a given application might look like :)

**Perfect World**

![Perfect World](/images/blogs/crime-scene/perfectworld.png)

**Reality**

![Reality](/images/blogs/crime-scene/reality.png)

### Final thoughts

Buy the book, or just check out the code from [GitHub](https://github.com/adamtornhill/code-maat), run the tools against your code, be surprised, do something about it!!
