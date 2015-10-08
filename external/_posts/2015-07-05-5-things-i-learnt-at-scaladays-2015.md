---
layout: post
title:  5 Things I Learnt at Scaladays 2015
date:   2015-07-05 10:00:00
author: Hubert Behaghel
categories: conferences scala
image: /images/Scala-Days-Amsterdam.jpg
excerpt: This year again, Scaladays was a blast. It took place in Amsterdam between 8th and 10th June. I was there and here is what I brought back.
---

This year again, Scaladays was a blast. It took place in Amsterdam 
between 8th and 10th June. I was there and here is what I brought back.

# Apache Spark Is Everywhere

That was the most astonishing to me: [Spark](https://spark.apache.org/docs/latest/index.html) was everywhere.

Spark is a new compute model written in Scala and Akka. At its core,
it is a platform to perform transformations and actions on distributed
collections. We call those collections [*Resilient Distributed Dataset*
(RDD)](https://spark.apache.org/docs/latest/programming-guide.html#resilient-distributed-datasets-rdds). Spark partitions them across its nodes and you, lovely
developer, you manipulate them using the lovely Scala Collections API.
That's it, you just don't feel the size. You don't feel the pain
either when a node dies.

Why do I think it is more than just a fancy trend in the Big Data
sphere? First, again, during the conference Spark went far beyond the
Big Data track. And the Scala community is usually good at spotting
the good stuff with respect to distributed systems. Second, [IBM is
betting big](http://www.forbes.com/sites/paulmiller/2015/06/15/ibm-backs-apache-spark-for-big-data-analytics/), really big on it. Third, there is the amazingly cool
[spark-notebook](https://github.com/andypetrella/spark-notebook). Maybe some of you remember I am big fan of
[Reproducible Research](http://reproducibleresearch.net/) and [Literate Programming](https://en.wikipedia.org/wiki/Literate_programming). I have [already](http://le-carnet.sky.com/posts/2015-01-10-happy-birthday-prof-knuth.html) shown
you [Org Mode on Emacs](https://youtu.be/fgizHHd7nOo) in action to illustrate those practices. Well,
spark-notebook is this but with a Spark cluster under the hood.
Brutal.

But I guess, what wins me here over Spark is that it just makes sense.
When I was working for the banking industry, I faced the problem of
migrating batch jobs into a modern architecture. The truth is an
enterprise level solution to run graphs of jobs crunching large amount
of data, we have not. Yet. Oh yes, with Map Reduce, Hadoop, NoSQL, you
have a nice toolbox. But it's far from what a z/OS delivers in terms
of productivity, integration with the business processes,
orchestration and quality of service. And it's all battery-included
with IBM. But now with Spark, all of a sudden it's not on par with the
good old mainframe, it's better. Forget orchestration and compilation
of execution plans, forget scheduling, it's continuous, it's
real-time.


Talks from Scaladays I recommend about Spark:

-   [Why Spark is the Next Top Compute Model](https://www.parleys.com/tutorial/why-spark-is-next-top-compute-model) by Dean Wampler ([slides](http://www.slideshare.net/deanwampler/why-spark-is-the-nexttopcomputemodel))
-   [Distributed Machine Learning 101 Using Spark from the Browser](https://www.parleys.com/tutorial/distributed-machine-learning-101-using-apache-spark-from-browser) by
    Xavier Tordoir and Andy Petrella ([slides](http://www.slideshare.net/noootsab/distributed-machine-learning-101-using-apache-spark-from-the-browser-49427626))

I have been playing with Spark lately, expect more about it soon!  

# ScalaJS Is Not Just Another Compiler To JS

Martin presented JS as a new backend to the language, just like it is
for Clojure. Clearly the level of support is not comparable at this
stage with the wonderful ClojureScript, but the direction is clear.

So what makes [ScalaJS](http://www.scala-js.org/) special? Sébastien Doraene, project lead,
mentioned 3 aspects: compatibility, interoperability and performance.
I could tell you how much I agree with Sébastien but instead, I'd
rather let you convince yourself by [trying it](http://www.scala-js-fiddle.com/) :-)


For me, the real differentiator is in the synergies between backend
and frontend. Richard Dallaway in his presentation *Browser And Server
Utopia* does this tour de force: he turns a JS client-side only text
editor into a Google Docs competitor in 200 lines of ScalaJS. He uses
a [CRDT](https://hal.archives-ouvertes.fr/file/index/docid/177693/filename/RR-treedoc.pdf) to do the hard work. I think it's genius. The gap between
frontend and backend is disappearing, frontend components are becoming
customer-facing nodes integral part of one distributed system. We
should think about it!

Talks from Scaladays I recommend about ScalaJS:

-   [Scala.js Semantics - and how they support performance and JS interop](https://www.parleys.com/tutorial/scala-js-semantics-how-support-performance-javascript-interop)
      by Sébastien Doeraene.
-   [Towards Browser and Server Utopia with Scala.js: an example using CRDTs](https://www.parleys.com/tutorial/towards-browser-server-utopia-scala-js-example-using-crdts) by Richard Dallaway

# Scala: Major Improvements In Sight

Martin also walked us through [Dotty](https://github.com/lampepfl/dotty) and [Tasty](https://docs.google.com/document/d/1Wp86JKpRxyWTqUU39H40ZdXOlacTNs20aTj7anZLQDw/edit#heading%3Dh.foemem8hq66y). Tasty is a new typed
abstract syntax tree used as interchange format with backends and
tools. Dotty is a rework of Scala to simplify few things and clean up
the language. On the clean-up side, XML literals for instance will be
gone for good<sup><a id="fnr.1" name="fnr.1" class="footref" href="#fn.1">1</a></sup>. Type system simplifications and backward
compatibility are on the menu as well. To be honest, it is only when
Roland Kuhn, Akka lead, tweeted this that I started to really get
excited about it:

<blockquote class="twitter-tweet" lang="en"><p lang="en" dir="ltr">Showing <a href="https://twitter.com/hashtag/Scala?src=hash">#Scala</a> puzzlers to <a href="https://twitter.com/odersky">@odersky</a> results in getting shown how dotty does not have them :-) ME WANT NOW!</p>&mdash; Roland Kuhn (@rolandkuhn) <a href="https://twitter.com/rolandkuhn/status/608709904594022400">June 10, 2015</a></blockquote>
<script async src="//platform.twitter.com/widgets.js"
charset="utf-8"></script>

I don't like languages with puzzle books<sup><a id="fnr.2" name="fnr.2" class="footref" href="#fn.2">2</a></sup>.

Other talks introduced us to the future of tooling in Scala:
[metaprogramming](http://scalameta.org/), [SBT](http://www.scala-sbt.org/) and [Ensime](https://github.com/ensime/ensime-server). SBT offers a [server-mode](https://github.com/sbt/sbt-remote-control) which I
think is a remarkable innovation<sup><a id="fnr.3" name="fnr.3" class="footref" href="#fn.3">3</a></sup>. We have so many tools to
coordinate around our build: browser, shell, incremental compiler,
IDE, etc. This architecture combined with the revamping of
`scala.meta` could well let us see a new generation of tools soon. Or
new features in Ensime, but it's so good already I am not sure how to
make it better :-)

Last but not least, Akka 3.0 is on its way. The big news is that Akka
actors will become more typesafe. Their programming model will gain in
simplicity and consistency. I think that was the best talk of the
conference:

-   [Project Galbma: Actor vs Types](https://www.parleys.com/tutorial/project-galbma-actors-vs-types) by Roland Kuhn

# Performance Is By Design

Yes, even on this blog we [already](http://le-carnet.sky.com/posts/2015-01-10-happy-birthday-prof-knuth.html) quoted Pr Knuth: "Early optimisation
is the root of all evil". That doesn't mean you shouldn't factor in
the need for speed when designing your solution. Quite the opposite in
fact, if you want to afford the luxury of late optimisation, it should
be baked into your approach from day 1: design, monitoring, stress
testing.

Here are three talks, each particularly relevant to each of those
areas. They are all worth it:

-   [The Reactive Streams Implementation Landscape](https://www.parleys.com/tutorial/the-reactive-streams-implementation-landscape) by Mathias Doenitz?
-   [Performance Testing Crash Course](https://www.parleys.com/tutorial/performance-testing-crash-course) by Dustin Whittle
-   [Kamon: Metrics and Traces for your Reactive App](https://www.parleys.com/tutorial/kamon-metrics-traces-your-reactive-application) by Ivan Topolnjak

While I was attending the last 2 talks, I had this little voice in my
mind that kept telling me: "you just don't have a performance strategy
at all…". That's being inspired, that's good.

# Thou Shall Get Out At Tech Conferences

Seriously. I hadn't been to a tech conference for 2 years before going
to this one<sup><a id="fnr.4" name="fnr.4" class="footref" href="#fn.4">4</a></sup>. On the very first hour there, I realised how big a
mistake it was. The new ideas, the real-life feedback, the electricity
of excitment about the future. It's as much about the people as it is
about the talks. So stop reading this blog, find the next conference
you'll go to and be determined to meet and talk to as many people as
you can once there.

If Scala is on your radar, check out [Scala.World](https://scala.world/). It's in the UK, it's
a new concept that blends hiking and tech and the panel of speakers is
incredible.

<div id="footnotes">
<div id="text-footnotes">

<div class="footdef"><sup><a id="fn.1" name="fn.1" class="footnum" href="#fnr.1">1</a></sup> It's already a <a href="https://github.com/scala/scala-xml">separate library</a>.</div>

<div class="footdef"><sup><a id="fn.2" name="fn.2" class="footnum" href="#fnr.2">2</a></sup> That's what drove me away from Java. The only exception is JS
because its puzzlers are so funny.</div>

<div class="footdef"><sup><a id="fn.3" name="fn.3" class="footnum" href="#fnr.3">3</a></sup> I am using it in a small project I plan to share with you at
some point.</div>

<div class="footdef"><sup><a id="fn.4" name="fn.4" class="footnum" href="#fnr.4">4</a></sup> Oh yes you may have seen me earlier this year at the QCon
London. It doesn't count. It is not techie enough. It's good to get
a feel for where this industry is going but it doesn't challenge you
on how you code, on how you are going to build your next system.</div>


</div>
</div>
