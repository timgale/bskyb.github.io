---
layout: post
title: "Maintaining code quality in Sky Store web"
date: 2015-06-17
author: Christopher Cook
categories: coding
image: /images/blogs/eslint.png
excerpt: "A summary of the tools and practices we use to try and achieve code quality in Sky Store Web."
---

There are many different views on code style and how to maintain it, but the consensus in our team was that within reason, we should be able to take a piece of code and not be able to identify who wrote it. These are the tools and practices we use to try and achieve this.

### ESLint
ESLint is nice because it removes the need for multiple tools when checking Javascript code. Previously, we used JSHint to evaluate against rules to help us follow best practices amongst other things, and Javascript Code Style Checker (JSCS) to help us enforce specific code style rules. ESLint combines these two tools, it has a very extensive set of rules that's split into several categories including possible errors, best practices that should be followed and stylistic issues that can be set depending on your team's choices. Besides combining multiple tools for checking the same thing, one of the key benefits of using ESLint is the fact that it allows custom rules to be written. It was designed to use pluggable rulesets that can be added or removed as needed, and given the fact that is uses the NPM infrastructure, it's easy to download community created rulesets and even create your own.

### SCSSLint
As front end developers, keeping our SCSS stylesheets consistent and at a high quality is equally important as keeping our Javascript code in order. We use SCSS-Lint which allows us to ensure consistency through our SCSS files by enforcing stylistic rules chosen by us. SCSS-Lint has more focus on stylistic choices than potential bad practices likes ESLint offers, but still has a large ruleset that's become essential for our team's development.

### Yeoman
Yeoman is a scaffolding tool that helps us ensure all our files follow the same base structure. Although Yeoman has a focus on the ability to quickly generate new projects, it also gives the functionality of writing custom generators. We created a custom generator that allows us to quickly kickstart a new feature in our app with all of the basic files we need. When a feature is created through Yeoman, it takes a feature name as input from the user and uses this to create all of our standard Javascript components (controller, directive, view model factory etc.) including unit tests that pass, as well as a basic HTML partial and SCSS style sheet. Using Yeoman in this way has made it much easier for new developers to get started on the team as quickly as possible and has increased code consistency a lot.

### Merge requests
One of the final practices we follow is merging all feature code to our codebase with Merge Requests through Gitlab. This can be a bit of a contentious point, some teams prefer pair programming, some prefer both. As we don't enforce pair programming in Sky Store Web, we find merge request procedure to be essential to our team's development and it's the best option in terms of allowing all members of the team to get exposure to as much of the code base as possible. Of course, the effectiveness of merge requests is completely dependant on what your team decides it wants out of the procedure, something that can constantly be improved.

### References
[https://github.com/eslint/eslint](https://github.com/eslint/eslint)

[http://jscs.info/](http://jscs.info/)

[https://github.com/jshint/jshint](https://github.com/jshint/jshint)

[https://github.com/brigade/scss-lint](https://github.com/brigade/scss-lint)

[http://yeoman.io/](http://yeoman.io/)
