---
layout: post
title: "Let’s build an MP3 decoder (2008)"
date: 2018-03-15 00:00:00 +0000
description: "Even though MP3 is probably the single most well known file format and codec on Earth, it’s not very well understood by most programmers – for many…"
tags:
  - wuubi
  - audio
  - code
  - mp3
  - sound
categories:
  - programming
  - technology
---

> Even though MP3 is probably the single most well known file format and codec on Earth, it’s not very well understood by most programmers – for many encoders/decoders is in the class of software “other people” write, like standard libraries or operating system kernels. This article will attempt to demystify the decoder, with short top-down primers on signal processing and information theory when necessary. Additionally, a small but not full-featured decoder will be written (in Haskell), suited to play around with.
>
> The focus on this article is on concepts and the design choices the MPEG team made when they designed the codec – not on uninteresting implementation details or heavy theory. Some parts of a decoder are quite arcane and are better understood by reading the specification, a good book on signal processing, or the many papers on MP3 (see references at the end).
>
> A note on the code: The decoder accompanying this article is written for readability, not speed. Additionally, some unusual features have been left out. The end result is a decoder that is inefficient and not standards compliant, but with hopefully readable code. You can grab the source here: [mp3decoder-0.0.1.tar.gz](http://hackage.haskell.org/cgi-bin/hackage-scripts/package/mp3decoder). Scroll down to the bottom of the article or see README for build instructions.
>
> With that out of the way, we begin our journey with the ear.

[Source](http://blog.bjrn.se/2008/10/lets-build-mp3-decoder.html)