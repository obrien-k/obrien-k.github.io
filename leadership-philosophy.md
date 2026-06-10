---
layout: plain
title: Leadership Philosophy
description: >
  Honesty, Communication, Resourcefulness, DAQ, Question Everything. 
  These are the pillars I believe establishes a successful leader.
hide_description: true
---

<style>
/* WS-D — rustic / coffee-stain pass (first draft). Token-driven so it respects
   light/dark + a11y greyscale: colours come from the shared --cp-* palette, which
   each skin sets and a11y neutralises to grey. Coffee ring is pure CSS (method a),
   no asset. */
.lp{
  --accent:rgb(var(--cp-accent-rgb));
  --accent2:rgb(var(--cp-accent2-rgb));
  --line:rgb(var(--cp-line-rgb));
  position:relative;
}
/* aged-paper cards: faint warm wash, a soft inner "double rule", and slightly
   hand-cut (irregular) corners so they read as torn paper, not CSS boxes. */
.lp .pillar{
  position:relative;
  border:1px solid rgb(var(--cp-line-rgb) / .55);
  border-radius:7px 11px 6px 10px;
  padding:.85rem 1rem;
  margin:0 0 .9rem;
  background:linear-gradient(rgb(var(--cp-accent2-rgb) / .05), rgb(var(--cp-accent2-rgb) / .05));
  box-shadow:inset 0 0 0 1px rgb(var(--cp-line-rgb) / .12), 0 1px 2px rgba(0,0,0,.07);
}
.lp .pillar h3{margin:0 0 .4rem;font-family:ui-monospace,"SFMono-Regular",Menlo,Consolas,monospace;font-size:.82rem;letter-spacing:.1em;text-transform:uppercase;color:var(--accent);font-weight:700;display:flex;gap:.65rem;align-items:baseline}
.lp .pillar h3 .n{color:var(--accent2);font-size:.72rem;font-weight:700}
.lp .pillar p{margin:0}
.lp a:focus-visible,.lp :focus-visible{outline:2px solid var(--accent);outline-offset:2px}

/* coffee-ring stain — a faint annulus left behind by a mug. Decorative only. */
.lp::after{
  content:"";
  position:absolute;
  top:-.6rem;right:.4rem;
  width:104px;height:104px;
  pointer-events:none;
  opacity:.5;
  transform:rotate(-7deg);
  background:radial-gradient(circle at 50% 50%,
    transparent 0 39px,
    rgb(var(--cp-line-rgb) / .42) 40px 42px,
    rgb(var(--cp-line-rgb) / .10) 43px 51px,
    transparent 52px);
}
@media (max-width:34rem){ .lp::after{ display:none } }
</style>

<div class="lp">

<div class="pillar"><h3><span class="n">01</span> Honesty</h3>
<p>Trust is a two-way street that is often travelled, but more often abandoned. I hold myself accountable to remain honest in all things, whether it is owning my mistakes, complete transparency, or otherwise.</p></div>

<div class="pillar"><h3><span class="n">02</span> Communication</h3>
<p>Creating an open line of communication with any peer of mine is tantamount to success. This will help build positive relationships, affirm grounded involvement, and ensure a healthy work environment.</p></div>

<div class="pillar"><h3><span class="n">03</span> Resourcefulness</h3>
<p>Conveying clear concise answers, while eliciting an understanding response, and bearing authoritative resources to reference.</p></div>

<div class="pillar"><h3><span class="n">04</span> DAQ</h3>
<p>Ask Questions when appropriate, Don’t Ask Questions when your Resourcefulness is failing you. What’s the question behind your question? No need for preamble: stick to the ask and your known facts.</p></div>

<div class="pillar"><h3><span class="n">05</span> Question Everything</h3>
<p>Assuming pillars 1 – 4 have failed you: with these tenements failed, how can we improve in a blameless cycle? Continuous integration and delivery rely on a well-structured foundation and workbench to honestly communicate, improve resources, and probe for causes of concern.</p></div>

</div>
