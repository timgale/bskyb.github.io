# Sky Developers Portal

A developers portal, in the open.  For developers at Sky (past, present and future) and by developers at Sky.


## So, you want to write a blog post?

Great!  You really should and it's easy to do. Don't get put off if you've never done this sort of thing before.

You'll need to do a little bit of work with github as our approval process uses the standard github pull request process.


#### Steps to get started

For those that know how to use git and do pull requests, jump to step 5.

1. Create a [github account](https://github.com/join) if you don't have one. Any standard github account will do, you don’t need special permissions

2. Ensure you're running a (git client)[http://git-scm.com/downloads] then ensure (you've set it up)[https://help.github.com/articles/set-up-git/]

3. Fork our repository.

4. Clone your fork locally.

5. [Install Jekyll](http://jekyllrb.com/docs/installation/) if you want to preview your blog post. If you don’t want to preview, then don’t worry about Jekyll. On a machine with [RubyGems](https://rubygems.org/pages/download), it's super quick

    gem install jekyll

6. Run jekyll from within your cloned project

    jekyll serve

7. Create a new file in the _posts directory.  Every file represents a post.  Each file should take the format YYYY-MM-DD-<meaningful-name-without-spaces>.markdown.  As an example “2015-04-13-hello-world”

8. Open the file and include the following header”

`---
layout: post
title:  “title”
date:   YYYY-MM-DD HH:MM:SS
categories: blog category
image: a link to an image to be used
excerpt: “An excerpt you want to appear in the blog summary screen”
---`

An example is as follows:-

`---
layout: post
title:  "Sky at Google I/O"
date:   2015-05-12 08:52:19
categories: conferences
image: images/test.png
excerpt: "Sky are attending Google I/O - here's what we're planning to see any why"
---`

9. Write your awesome post using standard markup.  See the (examples)[] or (documentation)[http://jekyllrb.com/docs/posts/].  If you're running Jekyll, the site will automatically update on saving your post.

10. Add, commit and push your post

11. Create a pull request into master.


## A quick note on images

Images can either be served from an external location (in which case, include the full url).  Alternatively, add them to the “images” directory.  They’ll then appear in images/<image name>

