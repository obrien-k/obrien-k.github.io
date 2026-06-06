---
layout: post
title: "How the WordPress developer community impacted me"
description: "Draft — WordPress, the Uber Googlers, Photoshop, and the BC4WP plugin."
tags:
  - code
categories:
  - code
---

## wp
has been in the news lately. I'm not here to talk about [Automaticc](<!--some related link-->). I'm here about software, the WordPress blogging software that more or less ran my life for a year, and always was in the corner of my mind as far as _who_ WP was for and that's just about anyone. A teenage "Uber Googler"](<!-- deviant art link -->) ([Ryu cheats](https://www.deviantart.com/xerocint/art/Ryu-Cheats-110476759)) -- Design was somewhat of a nature -- my UI-leanings were always towards the interface, the thing "something that you can hold in your hands" as Delta put it in LINKIN PARK's Meteora - Making Of video. Which is a story in-of itself which I highly recommend.

The full story of how I first began PhotoShop, I'll start here: my cousin showed me some of the ropes in PhotoShop 7.0 -- A relic, for anyone who was using the internet at my age at the time (arriving nearly 2 years before PhotoShop CS), but it was relevant enough to learn what mattered: making incremental changes to an image at hand-- you're at a baseball game and want to crop out some stray people grazing in the back of the otherwise clean photo. Immediately, I took to it like Microsoft Paint (shoutout: Paint.NET for existing, graduating to v1.0<!-- unsure double check what major release changes they've had-->) and trying to make my own images out of pure thought. After a while of playing with the tools and brushes, I began to peruse my old friend, the Internet. And this again, is a story from the long-long ago, where PhotoShop CS was out and I didn't have _all the capabilities of the latest release_, but I did have a partial git diff. And a lot to learn with how you start with "pure thought stuff" and reach a "something you can hold in your hands". Now we call everything "apps", but then it was "website". You didn't trade a Facebook, or a Spotify. You might have a Livejournal, or later, MySpace or last.fm. Blogger was my jam, and here we're reaching a bifrucation--I can't tell you **exactly** the first time I used, read a WordPress site. Once you know, you know though.

WordPress' general design-guidance is the hallmark of its success. Do you need a Blog-style format and possibly want to make minor (or major) changes with plugins, custom themes.. My best guess is, when I wanted to use [BuddyPress](https://wordpress.org/plugins/buddypress/) to connect to last.fm and MySpace. How little a ~14 year-old knows about how the internet works. This was [The Uber Googlers](https://web.archive.org/web/20071103072735/http://theubergooglers.com/) days as I mentioned, so I probably wanted to connect to the phpBB forum, which.. Had a plugin but I wanted my "concept"/sliced-html through.. another likely archived thread.

[![](/assets/img/blog/posts/wordpress-dev-community/uber-googlers-v0.png)](https://web.archive.org/web/20071103072735/http://theubergooglers.com/)
A sliced-HTML homepage concept from a prior user-name. The original is preserved on [Archive.org](https://web.archive.org/web/20071103072735/http://theubergooglers.com/), where the Wayback crawl never cached the image slices.
{:.figcaption}

[![](/assets/img/blog/posts/wordpress-dev-community/ubergooglers-2007-index.png)](https://web.archive.org/web/20071123225750/http://theubergooglers.com/forums/index.php)
The Uber Googlers in its first incarnation — *"Ubering Your Googling."* The board was still organized around the joke in its name: **Google Hacks** ("got any Google tricks or hacks? Post them here!"), Google News, Google Discussion, beside Off Topic (4,034 posts), Introductions, and Role Playing. Moderators: *rkän, duncanyoyo1, setnev, Mitxyku.* — [Archive.org](https://web.archive.org/web/20071123225750/http://theubergooglers.com/forums/index.php)
{:.figcaption}

[![](/assets/img/blog/posts/wordpress-dev-community/ubergooglers-2008-index.png)](https://web.archive.org/web/20080612135131/http://theubergooglers.com/forums/index.php)
By "Uber Googlers 2.0" (June 2008) the board had differentiated well past Google — Projekt Transformation, Photoshop Guides, Apple vs. PC reviews, OTMs ("Of The Months": Art, Video, Link, Member, Debate). 796 registered users, 15,939 posts; the most ever online at once was 31, on Nov 12, 2007. Moderators: *dearxstranger, doogly1.* — [Archive.org](https://web.archive.org/web/20080612135131/http://theubergooglers.com/forums/index.php)
{:.figcaption}

[![](/assets/img/blog/posts/wordpress-dev-community/ubergooglers-funhouse.png)](https://web.archive.org/web/20080305051814/http://theubergooglers.com/forums/viewforum.php?f=66)
The Fun House — 33 threads, 6,922 posts. The pulse of the place lived in the forum games: the Word Association Game, "Last Thing You Ate / Watched / Read," "Say Something About The Person Above" — one thread well past a thousand replies. — [Archive.org](https://web.archive.org/web/20080305051814/http://theubergooglers.com/forums/viewforum.php?f=66)
{:.figcaption}

We could wrestle with blogs/customization/plugin support but overall we're left with the WordPress community. The users tying it together that are the pulse of WordPress. They have a right to be lost and confused about how to proceed. 

So going back to the users: one user in particular I know very well: 

<!-- TODO: add Topher's avatar image -->
*Topher's well known avatar across the net.*
{:.figcaption}

The first Topher I met wasn't literally Topher, it was someone like Topher. 

The first thing I remember about SWIT they told me to slow down, they needed to: I was requesting someone to build a whole website architecture amassing APIs at [ludicrous speed](<!--LoneStar/Barf they've gone plaid.gif-->). Topher has this same precaution when working with WP-- how would the WordPress community feel about this? At BigCommerce, the BC4WP plugin was sheparded by he, and several other colleagues from BigCommerce, but was spearheaded by Topher acting as a liason for WordPress' pulse--and soul. When something wasn't an expected WordPress plugin flow he'd help surface the divergence, along with the team behind these projects delivering on regular cadence. BC4WP was originally built in partnership with BigCommerce (we'll get there in a while, but if you want to skip to the end ## The BigCommerce in the Room <!--insert citation link to this seciton in jekyl/hydejack-->), by WPEngine. Now we're getting spicy.

I never worked with WPEngine directly, but they seemed like a solid company from the one in-office interview I did with them while applying/waiting to hear back about a position at `Commerce` (again, I haven't worked there in awhile and a name change to a company makes explaining your resume more difficult), and _didn't_ get a position at WPEngine. I had studied a book of php theming with WordPress, and they turned me down? No shade to anyone in the room but it did put a chip on my soldier to double down on learning the [CLI](/dreaming-in-code-lucid-dreaming/#the-command-line)

Back to plugin hell: competency in design can be summarized by me as: knowing the limits of your architecture/surface of work. Seeing the BC4WP plugin was a "trophy-moment" for BigCommerce to me at the time. Having a competitive approach to opening the architecture up meant a better surface of level of connecting BigCommerce stores in lieu of something like WooCommerce. The installation was quirky (and in the all-hailed label of beta), but was smoothed out as feedback was received: the product sync proccess could hang for large stores, and v1 wasn't too far around the corner. I was a T1 at the time, but my recollection of earlier times when I used WordPress proliferated in a single moment, Here, I knew a fair amount of the architecture, theming, and the PHP I had so dreaded years before. PHP was just another script to parse.

## Gutenberg / Blocks

I'm fairly agnostic here, great for users afaik, I ran another WP on wuu.bi for a year or so ca.2017 https://web.archive.org/web/20180811200251/https://wuu.bi/

