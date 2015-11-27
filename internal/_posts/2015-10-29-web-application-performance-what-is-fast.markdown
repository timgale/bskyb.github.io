---
layout:  post
title:   "Web Application Performance, What is Fast?"
author:  "Tom Davidson (Principal Engineer - Online Service)"
date:    2015-10-29 14:10:00
image:   http://streamingvectors.com/wp-content/uploads/2014/01/IndiaCarSpeedDialGold32.jpg
excerpt: "Perceived performance is a key factor in abandonment rate and in the percentage of those abandonments that are permanent. How should we think about performance, measure it and know that we are fast enough?"
---

Perceived performance is a key factor in abandonment rate and in the percentage of those abandonments that are permanent. How should we think about performance, measure it and know that we are fast enough?

Performance can be measured as: "The top of the page is visually complete and all elements that are on-screen are fully interact-able.". This does not mean that elements near the top of the page need to be fully functional (e.g. a carousel must show the first frame but the buttons to slide left/right don't need to work yet) nor does it mean that elements further down need to be loaded (so images may be missing if the user isn't going to see it yet).

Sites perform differently depending on the caching of static assets, as such it’s not as simple as just a single measurement.  I’m considering the following scenarios:
 1. 'Fresh' use; nothing cached.
 2. Returned visitor; 2 hours since last visit, some things are still cached.
 3. In-session; everything that can be cached is cached.

Each application will have it's own targets and thresholds for performance but the table below can be used as a default state or a guide.

| Scenario | Load Performance (seconds) |
|----------|:--------------------------:|
|Fresh     |             3              |
|Return    |             1              |
|In-Session|             1              |

[Bryan McQuade](http://googlewebmastercentral.blogspot.ca/2013/08/making-smartphone-sites-load-fast.html) of Google set the aspiration of sub-second load times including for mobile. His team also provides their [Google's PageSpeed Insights](http://developers.google.com/speed/pagespeed/insights/) tool for testing this, it includes both a browser extension and an API for programmatic access.  [Google's "Mobile Analysis in PageSpeed Insights" docs](https://developers.google.com/speed/docs/insights/mobile) suggests that 3G latency will account for roughly 600ms (200ms for DNS lookup, 200ms for TCP connection and 200ms for HTTP request/response) leaving just 400ms for the server to generate the content and 200ms for the client to render the content; a tough challenge! A more realistic target is proposed at [When Design Best Practices Become Performance Worst Practices](http://uxmag.com/articles/when-design-best-practices-become-performance-worst-practices) which aims for 3 seconds (even on mobile).

[Jacob Nielson suggests](http://www.nngroup.com/articles/website-response-times/) that feature areas are specifically subject to user’s frail attention as interaction drops from 20% of eye-time to 1% of eye-time when page load time drops from 1 second to 8 seconds. I suggest that overall render time is less of a factor than the time between the first content appearing and the page being visually complete.

He also talks about performance ‘boundaries’:
 - A response in 0.1 seconds gives the feeling of instantaneous response — that is, the outcome feels like it was caused by the user, not the computer. This level of responsiveness is essential to support the feeling of direct manipulation
 - A response in 1 second keeps the user's flow of thought seamless. Users can sense a delay, and thus know the computer is generating the outcome, but they still feel in control of the overall experience and that they're moving freely rather than waiting on the computer. This degree of responsiveness is needed for good navigation.
 - A response in 10 seconds keeps the user's attention. From 1–10 seconds, users definitely feel at the mercy of the computer and wish it was faster, but they can handle it.
 - After 10 seconds, they start thinking about other things, making it harder to get their brains back on track once the computer finally does respond. The user may also think that they have done something wrong or the application is broken.

A 10-second delay will often make users leave a site immediately. And even if they stay, it's harder for them to understand what's going on, making it less likely that they'll succeed in any difficult tasks. Even a few seconds' delay is enough to create an unpleasant user experience. Users are no longer in control, and they're consciously annoyed by having to wait for the computer. Thus, with repeated short delays, users will give up unless they're extremely committed to completing the task. The result? You can easily lose half your conversions simply because your site is a few seconds too slow for each page.

If you have the added challenge of a more complex application wich utilises a number of tiers/services, especially if there are multiple teams involved you may want to frame the conversation around a performance 'budget'. The overall time to 'visually complete' may need to be 3 seconds but which part of the application and transport is going to take up that time and in what proportions?

| Component/Tier        | Performance Budget |
| --------------------- | :----------------: |
| DNS lookup            | 100ms              |
| HTTP(s) connection    | 200ms              |
| API call to backend 1 | 600ms              |
| API call to backend 2 | 600ms              |
| View rendering        | 50ms               |
| Asset load            | 400ms              |
| Asset parse & render  | 200ms              |
| **Total**             | **2150ms**         |
