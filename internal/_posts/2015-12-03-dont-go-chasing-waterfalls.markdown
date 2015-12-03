---
layout: post
title:  “Don&apos;t Go Chasing Waterfalls”
date:   2015-12-03
author: Steve Wells
categories: agile
image: /images/blogs/waterfalls.jpg
excerpt: “How mini-wateralls can creep into agile teams, and how to avoid them.”
---

## Intro
Although we all think our teams are highly Agile, and don't do that nasty old-fashioned 'Waterfall' stuff, many teams do, in fact, have mini-waterfalls in their development processes, and these cause a multitude of problems. The waterfall is very much an Agile anti-pattern, and needs to be avoided at all costs.

Although the argument in this blog is based around Scrum, the reasoning applies equally well to any Agile framework or process.

## What Is A Mini-Waterfall?
In the Scrum Guide[1], only 3 roles are recognised in a Scrum team:

* Product Owner
* Scrum Master
* Developers

In fact, to quote verbatim from the guide:

> Scrum recognizes no titles for Development Team members other than Developer,
regardless of the work being performed by the person; there are no exceptions to this rule

The idea being that the whole team take responsibility for all the work needed to get the software increments delivered. Software is produced collaboratively with the whole taking responsibility for getting the job done. Some developers may have "specialisations" - infrastructure, testing/QA, etc. - but as far as Scrum is concerned, they are all "developers". In many teams (*my current team included*), however, other roles have crept in, so the team looks more like this:

* Product Owner
* Scrum Master
* Analyst
* Developers
* Testers

In this scenario, the analyst and testers typically are not developers (in the normal, "non-scrum sense of "people who can code"), so we have immediately created a waterfall. The analyst works with the product owner to define stories which are passed over, complete with acceptance criteria, to the developers. The developers write the code, and hand it over to the testers to test.

Sound familiar? Well it's not Niagara Falls, but it is a waterfall. In "classic" waterfall, development and testing phases might well take many months; this kind of "agile waterfall" may only be a few days in each phase, but it is nonetheless a waterfall, and should be avoided.

## So Why Is This So Bad (Just Because It's Not "Scrum")?
Is this really such a big issue? The waterfall phases are only a few days long, and we still have stand-ups and retros so surely we're still being Agile? Well, no, we are not - these mini-waterfalls create all kinds of issues.

### Waterfalls creates silos
Having a dedicated analyst causes a knowledge silo that is a big risk to the team if that person leaves. However good the analyst is at cascading knowledge down to the developers, something is always lost in the translation, and certain knowledge resides only in the analyst's head. The same is true of any dedicated role - who else in the team knows the testers testing strategy, and why they test like they do?

### Waterfalls are inefficient in terms of resources
In a waterfall, one phase needs to complete before the next starts, thus developers are waiting for the analyst to finish, and testers are waiting for developers. This effectively means one of two things:

1. At the start of a sprint, testers are waiting around for developers to finish, at the end of the sprint, developers have nothing to do, or (*more commonly*)
2. Developers start new stories while testers test "dev-complete" stories, and there are lots of unfinished stories at the end of the sprint.

The second issue is particularly bad - sprint goals are never met, and unfinished stories just roll over into the next sprint. Trust that the team can deliver is lost, morale goes down, and the only recourse is that most common of cries in failing Scrum teams - "It's OK we're doing Kanban". Don't be fooled! What is being done in this situation is merely "not Scrum", it is certainly __not__ Kanban. It is in fact waterfall by another name. (*It's interesting that teams often say they are doing "Scrumban" when they aren't doing Scrum (or Kanban) correctly - surely they mean "Scrumfall"?...*)

### "Chinese Whispers"
As mentioned already, however good the analyst is at cascading knowledge down to the developers, something is always lost in the translation. The further a role is from the actual requirements, the less that role understands those requirements. So, by the time the product owner has told the analyst a requirement, the analyst has conveyed it to the developers, and the developers have handed it over to the testers, the testers will probably have little idea what the original requirement was, and how to test it. Typically they will end up testing what has been built, not what was required.

### The team is not equally empowered
Typically, in these situations the testers have a kind of "sign-off"; they find bugs and stop software being released because of them, until the bugs have been triaged and seen to be acceptable for release or fixed. This gives them unreasonable power, when, in fact, the whole team should be deciding on the quality of what is released.

### The team is not equally responsible
When there are dedicated, non-developer roles in a team, the team is no longer collectively responsible for the quality of the product. Developers develop, then hand responsibility to the testers. This kind of "over-the-wall" thinking means that the team as a whole is no longer collectively responsible - developers won't look at bugs that they deem un-reproducible, and testers will complain that developers haven't done enough basic testing before handing over the code. 

I have seen this in many teams.

### Waterfall stops failing early
A guiding principle of Agile is "fail fast"; in fact, fail as early as possible. Don't wait until code has been written and handed over to a test team before bugs are discovered. Bugs should be identified as soon as code is checked in (*or earlier, if possible?*). Otherwise, you may be adding code that relies on code that already contains bugs. Very dangerous.

To be properly Agile, testing should drive development so that bugs are identified (and hopefully fixed) as soon as they are written. 

### Entrenchment
Having defined roles means that the development process becomes entrenched - there has to be an analysis phase, there has to be a testing phase, and so on. This stifles process improvement, and is the direct opposite of the agile value of "people over process".  

## So How Does This Happen?
The biggest single cause of these kinds of waterfalls is recruiting to specific roles that are not "developer". Once these roles are cemented into a team, it becomes very difficult to change them. A tester leaves, and has to be replaced by another tester, otherwise it is a whole world of pain to change budgets and HR systems, etc. etc. 

Labelling the role also sets the expectation of what someone in that role should be doing. "developers" surely shouldn't be testing if there are "testers" in the team? If that is the case surely those "developers" are merely "coders"; they are only truly developers if they can take the original business requirement, work out how to build a solution that meets that requirement ("Analysis"), build the solution ("Developing/Coding") and make sure it actually meets the requirement ("Testing").

Once these roles are in place, not having slack within sprints mean there is not enough time to address the problem by cross-skilling team members so they can all do the tasks in all roles.

## Are There Other Waterfalls?
Potentially, yes, there are. What about these, which I have seen in many other teams.

* Product Owner (*who can make decisions*) > Proxy Product Owner (*who can't*) >  Developers

* Designers (*who get designs signed off*) > Product Owner > Developers

* Back End Team > UI Team > Testers

I'm sure there are may others.

## So What Are The Solutions?
The solution is relatively simple. Do what the Scrum Guide says - don't have roles apart from "developer", and make sure everyone can work on everything. 

Put automated testing in place, ideally on code checkin, so you can fail as early as possible, and testing is an integral part of the development, not a phase at the end. This also reduces the reliance on dedicated testers, and gives all kinds of benefits which are beyond the scope of this blog.

Make sure the developers collaborate directly with the Product Owner, and do the analysis and story definition between them. Make sure any test specialists (who should also be able to code), are involved at the start of development to write tests as the code is written and/or pair with the developer to identify what needs testing as code is developed. 

Basically, just go back to Scrum - it tells you how to avoid waterfalls. It may not be the most fashionable Agile framework at the moment, but if you do it as per the guide, you'll avoid waterfalls, and all the inherent problems they cause.

Scrum has its' detractors, but don't throw the baby out (*or over the waterfall?*) with the bathwater...

## References
[1] The Scrum Guide [http://www.scrumguides.org/docs/scrumguide/v1/scrum-guide-us.pdf]()