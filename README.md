# Sky Developers Portal

A developers portal, in the open.  For developers at Sky (past, present and future) and by developers at Sky.

## So, you want to write a blog post?

Great! You really should and it's easy to do. Don't get put off if you've never done this sort of thing before.

You'll need to do a little bit of work with GitHub as our approval process uses the standard GitHub pull request process.

## Getting Started

For those familiar with git and github pull requests, skip forward to installing Jekyll.

* Create a [github account](https://github.com/join) if you don't have one. Any standard github account will do, you don’t need special permissions

* Ensure you're running a [git client](http://git-scm.com/downloads) then ensure [you've set it up](https://help.github.com/articles/set-up-git/)

* [Fork our repository and clone it to your machine](https://help.github.com/articles/fork-a-repo/).

* [Install Jekyll](http://jekyllrb.com/docs/installation/) if you want to preview your blog post. If you don’t want to preview, then don’t worry about Jekyll. On a machine with [RubyGems](https://rubygems.org/pages/download), it's super quick

```
gem install jekyll
```

* Run jekyll from within your cloned project

```
jekyll serve
```

## Steps to write a blog post

* Posts can be viewed either internally or externally. All external posts can be viewed from an internal source, but internal posts cannot be viewed from an external source.
* To create a new internal post, create a file in the **internal/_posts** directory. To create a new external post, create a file in the **external/_posts** directory. Each file should take the format YYYY-MM-DD-<meaningful-name-without-spaces>.markdown.  As an example “2015-04-13-hello-world”

* Open the file and include the following header

```
---
layout: post
title:  “title”
date:   YYYY-MM-DD HH:MM:SS
author: First Last
categories: blog category
image: a link to an image to be used
excerpt: “An excerpt you want to appear in the blog summary screen”
---
```
An example is as follows:-
```
---
layout: post
title:  "Sky at Google I/O"
date:   2015-05-12 08:52:19
author: Donald Knuth
categories: conferences
image: images/test.png
excerpt: "Sky are attending Google I/O - here's what we're planning to see any why"
---
```

* Write your awesome post using standard markup. See the [examples](https://github.com/BSkyB/bskyb.github.io/blob/master/_example_posts/2015-05-05-example-post.markdown) or [documentation](http://jekyllrb.com/docs/posts/). If you're running Jekyll, the site will automatically update on saving your post.

* Add, commit and push your post

* [Create a pull request into master](https://help.github.com/articles/using-pull-requests/). Then wait for it to be merged. It will automatically appear on developers.sky.com once merged.

* Posts that are destined for external viewing will likely take longer to be reviewed, as the post will go through an approval process to ensure it conforms against the [guidelines](https://github.com/BSkyB/bskyb.github.io/wiki/External-Guidelines).

### A quick note on images

Images can either be served from an external location (in which case, include the full url). Alternatively, add them to the “images/blogs” directory. They’ll then appear in images/blogs/<image name>


## Steps to create an event

* Create your talk in the `event.json` file, ensuring you follow the chronological order (earliest first). If you're running Jekyll, the site will automatically update on saving your post.

* Your event should follow the following format:
```
"title": "The title of your event",
"link": "A link to your event page / talk",
"date": "The date range of your event",
"image": "A thumbnail image for your event that will appear in the carousel, preferably in the ratio 16:9",
"banner": "A banner image for your event that displays above the carousel when your tile is the primary focus",
"description": "A description of your event that appears inside the panel. This should be written in HTML inside these quotes"
```

* Add, commit and push your event

* [Create a pull request into master](https://help.github.com/articles/using-pull-requests/). Then wait for it to be merged. It will automatically appear on developers.sky.com once merged.

* Please ensure it conforms to the [guidelines](https://github.com/BSkyB/bskyb.github.io/wiki/External-Guidelines).

### A quick note on images

Images can either be served from an external location (in which case, include the full url). Alternatively, add them to the “images/events/{banner|logo}" directory. They’ll then appear in images/events/{banner|logo}/<image name>

## Steps to post a talk we've given

* Create your event in the `talk.json` file, ensuring you follow the chronological order (latest first). If your event also still appears in 'events.json', please remove it. If you're running Jekyll, the site will automatically update on saving your post.

* Your talk should follow the following format:
```
"title": "The title of your talk",
"author": "The speaker at your talk",
"link": "A link (if available) to the talk website",
"date": "The date of your talk",
"description": "A description of your talk that appears inside the panel. This should be written in HTML inside these quotes",
"video": "An embedded link to the video of your talk (preferably YouTube). If no video is available, please include the same image link that you use for your 'image' (Please avoid this option if possible).",
"image": "A thumbnail image for your talk that will appear in the tile, preferably in the ratio 16:9"
```

* Add, commit and push your talk

* [Create a pull request into master](https://help.github.com/articles/using-pull-requests/). Then wait for it to be merged. It will automatically appear on developers.sky.com once merged.

* Please ensure it conforms to the [guidelines](https://github.com/BSkyB/bskyb.github.io/wiki/External-Guidelines).

### A quick note on images

Images can either be served from an external location (in which case, include the full url). Alternatively, add them to the “images/events/logo" directory. They’ll then appear in images/events/logo/<image name>
