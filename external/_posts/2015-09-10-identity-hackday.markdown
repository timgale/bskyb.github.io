---
layout: post
title:  "Sky Identity Hackday - the lowdown"
date:   2015-09-19 11:36:00
author: "Paul Thornton (Delivery Manager - Sky Identity)"
categories: hackday
image: /images/blogs/identity/hackteams.jpeg
excerpt: "For those who aren't aware, Sky Identity is the delivery area behind Sky's authentication services,
comprising of four Scrum Teams (Sky iD, Oogway, Rango, Europa), and a dedicated security (i3) and DevOps teams.
As such, the wealth of talent was recently put on display during at our internal hackday.  Find out what we got up to..."
---

<h1>About the event</h1>

First off, thanks to all those who assisted with the preparation and who contributed to Identity’s hackday,
it was good to see so many involved and some interesting ideas progressed.
Special thanks to Rob McRitchie and Satnam Suman to help organise, and to Jon Mullen and Simon Cantlon for assisting with the judging.

<img src="/images/blogs/identity/hackteams.jpeg" width="100%">

<h3>Winner</h3>
The winner was <strong>Team Skyfall</strong> (Bulut Korkmaz and Sanjida Gafur) who produced the <strong>“Multi-lingual Sky iD Admin Widget with Content Management (using a graph database)”</strong>
with added special effects!!  It allows administrators to update the text and order of fields that the widget renders, in a friendly/innovative manner.

The front-end was built on Sky iD's current technology stack, leveraging HTML5, JavaScript, CSS3, and AngularJS.
To store messages in the back-end, the <a href="http://neo4j.com/developer/get-started/">neoj4</a> graph
database and Java <a href="http://projects.spring.io/spring-data-neo4j/">spring-data-neo4j</a> API was used.

Well done Bulut and Sanjida!

<img src="/images/blogs/identity/IMG_0548.jpeg" width="100%">

A short demo can be viewed below.
<ul>
<li><a href="/images/blogs/identity/admin widget.mp4">View the Screencast (mp4)</a></li>
</ul>

<video width="100%"  controls>
  <source src="/images/blogs/identity/admin widget.mp4" type="video/mp4">
Your browser does not support the video tag.
</video>


<h3>Second Place</h3>
In second was <strong>Team Teflon</strong> (Adam Niklaus, Juan Vaccari, Vinit More, Dawid Sawa, Patric Hogan) with <strong>"Hardening of Sign-in"</strong>, they introduced an innovated way of
improving the security on the sign-in journey, with minimal (if not any) impact
to the customer, but with a great benefit - effectively invalidating most, if not all, existing malicious scripts.

The idea has since been passed on to the Sky iD Scrum Team to assess in more detail and to determine whether it can be roadmapped.

Given the nature of the hack, we don't want to advertise the proposal in detail, but if you are interested feel free to contact the <a href="mailto:DL-i3@bskyb.com">Sky iD i3</a>
security team for more information.

<img src="/images/blogs/identity/i3.jpeg" width="100%">

<h3>Third Place</h3>

In third was <strong>Team Bulut</strong> (Adarsh Ramamurthy, Jay Parmer, Yasin Efe) with <strong>"Spring Cloud Config Admin App"</strong>, they presented a polished application demonstrating runtime configuration
management using <a href="http://projects.spring.io/spring-cloud/">Spring Cloud</a>.

<img src="/images/blogs/identity/Bulut.jpeg" width="100%">

They demonstrated how <a href="http://cloud.spring.io/spring-cloud-config/">Spring Cloud Config</a>
can be used to build an Admin app for managing both app-specific and common config across multiple microservices.

<img src="/images/blogs/identity/springcloud/Config Server.png" width="100%">

The hack also demonstrates that the config changes can be hot-pushed to individual microservices (or in bulk) without having to restart them.
If a change needs to be persisted, one could update the central Git repository (where the config files for all the apps for all the environments
will be stored) and reload the apps (not demonstrated but possible using Spring Cloud Config).

<img src="/images/blogs/identity/springcloud/1.png" width="100%">

<strong>Technologies used:</strong>
Spring Boot, Spring Cloud Config, Spring Cloud Bus, Rabbit MQ, Git, Docker, Docker Compose, Gradle, Groovy, Java 8

<img src="/images/blogs/identity/springcloud/8.png" width="100%">
<sup>Terminal showing multiple Docker containers logging config event broadcast related info to console.</sup>


Again, thanks to all who took part and let’s look to take some learnings into the next one to make it bigger and better.

<img src="/images/blogs/identity/JoIan.jpeg" width="49%">
<img src="/images/blogs/identity/RamAndrew.jpeg" width="49%">
<img src="/images/blogs/identity/Charles.jpeg" width="49%">
<img src="/images/blogs/identity/DaveIbra.jpeg" width="49%">
<img src="/images/blogs/identity/james_ben.jpeg" width="49%">
