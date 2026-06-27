---
layout: post
title: "The Android's Dream; A Love Letter to the Bomb"
date: 2020-06-14 00:00:00 +0000
description: "WordPress, the Uber Googlers, Orphic Inc., BC4WP, and WhatCo.de — five answers to one question: does it fall apart?"
tags:
  - code
categories:
  - code
image:
  path: /assets/img/blog/posts/wordpress-dev-community/uber-googlers-v0.png
---

## UPDATE
## [DONE](https://korin.green)

Ehh... Start over?

Agentic work is something I only briefly touched in, and will only be lightly touched on again today. Automating my XX years of studying the web, servers, infrastructure, code, all the things.. What does it mean when we're building up whole universes at the snap of a finger? Alchemical weapons have existed long before the rise of LLMs, and reproducing failing tests typically leads to higher likelihood of greenery. Whether or not the love letter falls apart, that's for you to say.

Where most sites might include an "Introductory" post [by this point](https://gitlab.whatco.de/root/kyle-o-io/-/wikis/Blog-Posts), I think the true meaning behind this one will only become more clear organically.

[In as such was proven](https://kyleo.io/dreaming-in-code-lucid-dreaming/#fnref7), software time has [claimed yet another milestone](https://gitlab.whatco.de/root/what-code-public/-/milestones/1). For me, this would be an autonomous form of the existing back-end for [What Code](https://whatco.de), and [save for upstream issues](https://gitlab.whatco.de/root/what-code-public/-/issues/2) it was near complete. With enough rigor it's possible to work around this, but would also be reverted if GitLab does at some point resolve it on their own.

The purpose of this article is to retroactively collect my thoughts on trying to autonomously instantiate Docker containers through Google Kubernetes Engine ([as well as my host](https://techcrunch.com/2022/04/14/why-akamai-bought-linode/) [Linode's LKE](https://www.linode.com/content/linode-kubernetes-engine-easily-deploy-kubernetes-with-lke/)) with an explanation of why and what that means. I'll also prepare any possible future iterations in conceptual form, and share some of my own opinions on these solutions for deployment.

I'd be remiss to neglect mentioning that I had prior misgivings with Docker and these misgivings only surface themselves further when attempting a full-scale application reliant on it as a foundation.

While in the pursuit of optimization with a optimistic attitude, developers often find themselves in a task they're unable to pursue: the scope outweighs the technical debt of the project. During self-projects we're able to fall on re-scopes, but when demand outweighs the means a re-engagement in approach is necessary. It's at this point where I found myself with What Code when a beacon of light appeared in the form of [Cloudron.io](https://cloudron.io). Henceforth, I found and was reminded of many projects in a similar vein [read: [Nacelle](https://techcrunch.com/2020/06/29/nacelle-raises-4-8m-for-its-headless-e-commerce-platform/), [yunohost](https://yunohost.org/#/)]. While some workarounds are available for the issue I ran into, the overall execution is one that I find unsustainable. This is a re-occurring theme when each time I revisit attempting this project, it's only after a long enough break that I even realize the stop-gap solutions I'll have on hand are cohesively dead on arrival.

As with my previous entry, history is required to understand the ultimate goal which will be revealed in time.

## wp

has been in the news lately. I'm not here to talk about [Automaticc](<!--some related link-->). I'm here about software, the WordPress blogging software that more or less ran my life for a year, and always was in the corner of my mind as far as _who_ WP was for and that's just about anyone. A teenage "Uber Googler"](<!-- deviant art link -->) ([Ryu cheats](https://www.deviantart.com/xerocint/art/Ryu-Cheats-110476759)) -- Design was somewhat of a nature -- my UI-leanings were always towards the interface, the thing "something that you can hold in your hands" as Delta put it in LINKIN PARK's Meteora - Making Of video. Which is a story in-of itself which I highly recommend.

The full story of how I first began PhotoShop, I'll start here: my cousin showed me some of the ropes in PhotoShop 7.0 -- A relic, for anyone who was using the internet at my age at the time (arriving nearly 2 years before PhotoShop CS), but it was relevant enough to learn what mattered: making incremental changes to an image at hand-- you're at a baseball game and want to crop out some stray people grazing in the back of the otherwise clean photo. Immediately, I took to it like Microsoft Paint (shoutout: Paint.NET for existing, graduating to v1.0<!-- unsure double check what major release changes they've had-->) and trying to make my own images out of pure thought. After a while of playing with the tools and brushes, I began to peruse my old friend, the Internet. And this again, is a story from the long-long ago, where PhotoShop CS was out and I didn't have _all the capabilities of the latest release_, but I did have a partial git diff. And a lot to learn with how you start with "pure thought stuff" and reach a "something you can hold in your hands". Now we call everything "apps", but then it was "website". You didn't trade a Facebook, or a Spotify. You might have a Livejournal, or later, MySpace or last.fm. Blogger was my jam, and here we're reaching a bifrucation--I can't tell you **exactly** the first time I used, read a WordPress site. Once you know, you know though.

WordPress' general design-guidance is the hallmark of its success. Do you need a Blog-style format and possibly want to make minor (or major) changes with plugins, custom themes.. My best guess is, when I wanted to use [BuddyPress](https://wordpress.org/plugins/buddypress/) to connect to last.fm and MySpace. How little a ~14 year-old knows about how the internet works. This was [The Uber Googlers](https://web.archive.org/web/20071103072735/http://theubergooglers.com/) days as I mentioned, so I probably wanted to connect to the phpBB forum, which.. Had a plugin but I wanted my "concept"/sliced-html through.. another likely archived thread.

## December 3 2006

December 3, 2006 marked the launch of "Orphic, Inc.". This was a forum that I'd intended to be a business as the name suggests, albeit much would prove difficult to a teenage entrepreneur. I launched Orphic, Inc. on [ProBoards](https://proboards.com) after having spent a month doing a soft-launch with friends. To complete the journey, you [might remember my mentioning learning about graphic design and the like through communities](https://kyleo.io/dreaming-in-code-lucid-dreaming#Teenage-Debugging), but my story also begins with another one which I wrote at an even younger age. The original concept behind my business was to self-publish a work of fiction I had written for some years prior, having already spent some time trying to teach myself to design a book cover and build a website for it. It seems more novel in hindsight, but the results always astound me whenever I take a moment to step back and breathe.

It does warrant a second warning for the image host Photobucket's mass deactivation of accounts as I wouldn't know the account's username or email associated with it:

[![Orphic, Inc. — December 30, 2006](/assets/img/blog/posts/a-universe/orphic-2006-12-30.jpg)](/assets/img/blog/posts/a-universe/orphic-2006-12-30.jpg)
Orphic, Inc. on ProBoards, December 30, 2006 — Photobucket's "PLEASE UPDATE YOUR ACCOUNT" tombstones now stand where the sliced graphics were. Most users ever online was 21, on Dec 16, 2006.
{:.figcaption}

[![Orphic, Inc. — August 26, 2007](/assets/img/blog/posts/a-universe/orphic-2007-08-26.jpg)](/assets/img/blog/posts/a-universe/orphic-2007-08-26.jpg)
*"what would you do if it were you?"* — typ0, Iss. 1: June/06, the 6,000-post mark, and a "Next 'Everyone Get On' date." The board had a News, a Haven, Apply!, Requests, Suggestions.
{:.figcaption}

[![Orphic, Inc. — September 7, 2007](/assets/img/blog/posts/a-universe/orphic-2007-09-07.jpg)](/assets/img/blog/posts/a-universe/orphic-2007-09-07.jpg)
By the 7,000-post banner: *"From now on, if someone goes off topic: Who cares? let em. Let the topic flow like a regular conversation."* Business Divisions, 185 members.
{:.figcaption}

This is when a huge slip-up occurred (ugh?), unappeased with the slow-crawl growth I had seen, I decided to commission one of the newly found graphics forums I'd been attempting to hone my craft on (I vaguely recall thinking the aesthetic would bring more people, but I really attribute this to my commitment to process). I was so excited by their forum when I found it, if I had a similarly appearance it'd work my forum as well, right?

[![orphic… pearlLiquidation — a commissioned sliced-HTML banner](/assets/img/blog/posts/a-universe/orphic-v3-banner.jpg)](/assets/img/blog/posts/a-universe/orphic-v3-banner.jpg)
The commissioned aesthetic — *orphic… pearlLiquidation.*
{:.figcaption}

It's the same with Orphic where I was the lead designer, coder, and founder of the website. I was trying to form a community around my book/literally just trying to get people to read it/advertise it/seeking a book deal ("the idea" in the `long, long ago`) and ended up in my trying to learn `business`. UG didn't exist until a year after Orphic, and Orphic was more or less scrapped as an idea--honed my concept into focusing on news about one company rather than trying to create my own from scratch, could focus on strengths, writing, forums, some design.

## 12,308

I registered theubergooglers.com on October 21, 2007 via BlueHost and used the cPanel front-end to manage html files and a phpbb instance via fantastico deluxe, then later a blog using WordPress + failure to implement phpbb with the wordpress instance.. So I was an administrator, podcaster (there was a few-episode podcast series), and forum moderator. There were several other staff members.

Using methods [I'd experienced as effective myself](https://youtu.be/IqQzvfn_s30?t=109), I shared several forms of "viral marketing" as I'd likely consider it at the time. On December 03, 2008 (or 12.3.08) I launched The Uber Googlers using [phpBB](https://phpbb.com), thoughts about a book were a far-gone idea after I had discovered an affinity for code in between.

[![The Uber Googlers — October 2007](/assets/img/blog/posts/a-universe/ubergooglers-2007-10.png)](/assets/img/blog/posts/a-universe/ubergooglers-2007-10.png)
The Uber Googlers, October 2007 — Tech Haven barely warm: Computer / PSP / DS / Xbox 360 / PS3 / Wii / Apple Talk, 110 posts, 6 registered users, moderators *«Kai», duncanyoyo1.* Most ever online: 12, on Oct 22, 2007.
{:.figcaption}

[![The Uber Googlers — November 2007](/assets/img/blog/posts/a-universe/ubergooglers-2007-11.png)](/assets/img/blog/posts/a-universe/ubergooglers-2007-11.png)
A month later, November 2007 — Tech Haven differentiated into Computer / Nintendo / Microsoft / Sony / Apple / Entertainment Talk, a Site News board, Video Comments for the podcast, an Archive ("where all old and unneeded — but they will always have a place in our hearts &lt;3 — threads will go"). 5,956 posts, 78 registered users. Moderators *«Kai», duncanyoyo1, setnev, Mitsyku.*
{:.figcaption}

We could wrestle with blogs/customization/plugin support but overall we're left with the WordPress community. The users tying it together that are the pulse of WordPress. They have a right to be lost and confused about how to proceed.

So going back to the users: one user in particular I know very well:

<!-- TODO: add Topher's avatar image -->
*Topher's well known avatar across the net.*
{:.figcaption}

The first Topher I met wasn't literally Topher, it was someone like Topher.

The first thing I remember about SWIT they told me to slow down, they needed to: I was requesting someone to build a whole website architecture amassing APIs at [ludicrous speed](<!--LoneStar/Barf they've gone plaid.gif-->). Topher has this same precaution when working with WP-- how would the WordPress community feel about this? At BigCommerce, the BC4WP plugin was sheparded by he, and several other colleagues from BigCommerce, but was spearheaded by Topher acting as a liason for WordPress' pulse--and soul. When something wasn't an expected WordPress plugin flow he'd help surface the divergence, along with the team behind these projects delivering on regular cadence. BC4WP was originally built in partnership with BigCommerce (we'll get there in a while, but if you want to skip to the end [## The BigCommerce in the Room](#the-bigcommerce-in-the-room)), by WPEngine. Now we're getting spicy.

I never worked with WPEngine directly, but they seemed like a solid company from the one in-office interview I did with them while applying/waiting to hear back about a position at `Commerce` (again, I haven't worked there in awhile and a name change to a company makes explaining your resume more difficult), and _didn't_ get a position at WPEngine. I had studied a book of php theming with WordPress, and they turned me down? No shade to anyone in the room but it did put a chip on my soldier to double down on learning the [CLI](/dreaming-in-code-lucid-dreaming/#the-command-line)

Back to plugin hell: competency in design can be summarized by me as: knowing the limits of your architecture/surface of work. Seeing the BC4WP plugin was a "trophy-moment" for BigCommerce to me at the time. Having a competitive approach to opening the architecture up meant a better surface of level of connecting BigCommerce stores in lieu of something like WooCommerce. The installation was quirky (and in the all-hailed label of beta), but was smoothed out as feedback was received: the product sync proccess could hang for large stores, and v1 wasn't too far around the corner. I was a T1 at the time, but my recollection of earlier times when I used WordPress proliferated in a single moment, Here, I knew a fair amount of the architecture, theming, and the PHP I had so dreaded years before. PHP was just another script to parse.

## The BigCommerce in the Room

The common-trope there, BigCommerce has been a failure in the news lately, their stock underperformed year-over-year until a dramatic restructuring where they changed CEOs and in the past year changed their name to Commerce. I left BigCommerce with a heavy heart, I felt the inevitable post-IPO change on the horizon and didn't expect the stock to perform well. By leaving BigCommerce, I rejected a grant of over a thousand shares, woth approximately $100,000 at the time. By the time I was able to sell it (30 days earlier than I would have if I stayed, due to my early exit), that had dropped significantly and I'm only including my "inelligible" shares. For context, that thousand was much more than my intial stock option grant as a new hire in 2017.

I do this to lovingly "run them through the coals" so to speak, as I said I left with a heavy heart and wished my former colleagues the best. I call my time at BigCommerce as learning what a real engineering team looks like and that has stayed true until today. Mostly. I've noticed a wide-berth departure of nearly everyone I would consider an "A player", whether due to finding better work or one of their slew of layoffs. The primary sticking point I found from even my early days was how BigCommerce constantly compared itself to Shopify when they should focus on their own product.

This was seen in other projects where BigCommerce felt like it got in its own way. BC4WP consistently had to fight for _what made sense_ rather than more involved discussions that could easily deteriorate against "what's the best long term decision?" or similar questions. When working at Apollo, I was contacted by a BigCommerce employee who was interested in applying federated GraphQL concepts to BigCommerce's relay-style GraphQL only to be stymied their own team.

## The ladder of the stack

Settling for a project that builds successfully and resolves failure gracefully is a fair measure especially on brownfield projects, but pursuit of this in greener pastures accelerate your path to a graveyard. Retaining deathmarch-style actions as practice is wasteful and mythologizing your month is equally manic.

It was 3 years ago in 2020 when that scrap was written, prior to [Dreaming in Code](/dreaming-in-code-lucid-dreaming/), led to that article, but some of the pieces weren't ever complete e.g. the infrastructure stability stuff, which was touched on briefly in [Waking Software Engineering](/waking-software-engineering/).

A year ago I laughed at GitLab, needing to have a whole custom instance to get a custom domain level version of it going

3 years ago it was similar with SSLs and getting the Apache Virtual Hosts setup

Similar story 2 years ago, except with NGINX/wildcard SSLs/databases for things like WordPress.

While it feels unfortunate to say, this new pattern has emerged of _mostly_ finishing what I want/need and I’m actually okay with it. That being a part of the pattern specifically makes it unsurprising as it’s part of the learning process. In the same way I expected to be able to go from creating a form with JavaScript at 12 to a fully functional platform, I’ll always quickly re-learn the steps in between.

## "There's gotta be a better way" approach vs ["How hard could it be"](https://www.youtube.com/watch?v=FKTxC9pl-WM) approach

## If you're not fucked, you're fucking

> that's when things get fucky

> If you a have a problem with cursing, fucking talk to HR

Don't forget you started trying this out by deploying GitLab with Rancher and that was just as fucked.

I'm really combating the premise of this title by destroying everything practically more-or-less every week for.. oh 3 months or so now?

## How to Build an App That Doesn't Fall Apart Two Days Later

Last night, while amidst [this project (private link!)](BigCommerce-Developer-Advocate-app) I discovered https://whatco.de to be on an incorrect version and to make a long story short caused a kerfuffle of mass proportions that ruined the instance effectively. I need to come back to this but essentially the steps up to this point made it much easier, a somewhat abstract goal behind wanting to spin up GitLab so there is some effectiveness after all is said and done. I was able to quickly load in a Ghost CMS container on the latest version (the reason I tried modifying ghost folder permissions to begin with) and port over the loaded storage drive.

I'm essentially trying to open this access like Netlify has but packaged with GitLab. This creates an end-to-end DevOps experience [as they describe](https://about.gitlab.com/concurrent-devops/).

## Conclusion

Know your limits but that of your hardware can be a good measure for what is truly necessary. In turn, you're able to gauge what actually matters especially when looking from a larger pool of perspective. I don't expect an app idea to come out of the end of this post, but reaching towards app ideas should be a clear indication of whether I missed my mark. If it comes across that my findings are recommendations, I'm not intending to imply an understanding of Linux is necessary to program (or anything else at all from this or my prior post), my path is one still fairly wild and without many passers-by. A combination of these anecdotes and events of discovery (and self-discovery) allowed me to become a better programmer with enough perseverance and a proper strategy.

Programming isn't about app ideas, it's whether or not your code could be used for something bigger than ideas.

The purpose of WhatCo.DE is fairly difficult to define and is part of the namesake. This is meant to create a sustainable system using Open Source software or platforms which will further propagate it's viability (with the goal of making it stable and _easy_) as a system through which anyone can spin up a site with virtually unlimited bandwidth and begin their own developer journey.

For example, I hope wuu.bi to inspire others to create their own mastodon instances, same for tube.wuu.bi and PeerTube. I've had an eye on these platforms for years and I was overjoyed at how successful they've been the closer I looked.

What the idea comes down to is enabling that first degree of a touchstone, while in no way can I enable a former self, I look forward to a future where such a reality could be launched with the touch of a button. It's unrealistic to attempt any possible futures that would've brought me, but I do imagine a time where a user's first interaction with the web is one of their own making.

This might start as an application by their own hand and code, albeit completely rail-roaded. What excites me the most about a concept like this is that it would evolve beyond software by the varied nature of this course and enter a realm I thought impossible: technology that grows.

## Colophon

## Include wear sunscreen quotes?
https://www.chicagotribune.com/columns/chi-schmich-sunscreen-column-column.html
was thinking primarily bubblegum algebra

[Masterclass in Presentation/Persuation, Macworld 2007](https://youtu.be/VQKMoT-6XSg) -- [Something about how the back looks better than their front](https://youtu.be/0BHPtoTctDY?t=350)

Up in the air... floats like the wind? Is there something like WiFi/network that could be “latched onto”?
