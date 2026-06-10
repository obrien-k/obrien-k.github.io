---
layout: page
title: Tags
permalink: /tags/
description: Browse posts by tag.
---

Browse by tag — each links to its archive page. For broad topics, see the
categories on the [archive]({{ '/archive/' | relative_url }}).

<ul class="tag-cloud">
  {% assign tags = site.tags | sort %}
  {% for tag in tags %}
    <li>
      <a href="{{ '/tags/' | append: tag[0] | slugify | append: '/' | relative_url }}">{{ tag[0] }}</a>
      <span class="tag-count">{{ tag[1].size }}</span>
    </li>
  {% endfor %}
</ul>

<style>
  .tag-cloud {
    list-style: none;
    margin: 1.5rem 0 0;
    padding: 0;
    display: flex;
    flex-wrap: wrap;
    gap: .5rem;
  }
  .tag-cloud li { margin: 0; }
  .tag-cloud a {
    display: inline-block;
    padding: .2rem .6rem;
    border: 1px solid rgb(var(--accent-rgb) / .45);
    border-radius: var(--chip-radius, .4rem);
    font-size: .85rem;
    text-decoration: none;
  }
  .tag-cloud a:hover { border-color: rgb(var(--accent-rgb)); }
  .tag-count { font-size: .72rem; opacity: .6; margin-left: .1rem; }
</style>
