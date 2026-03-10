---
layout: single
title: "Research"
permalink: /research/
author_profile: true
---

{% include base_path %}

<!-- MathJax for LaTeX rendering -->
<script>
window.MathJax = {
  tex: {
    inlineMath: [['$', '$'], ['\\(', '\\)']],
    displayMath: [['$$', '$$'], ['\\[', '\\]']]
  }
};
</script>
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>

<style>
/* Hide default title rendered by layout on this page only */
.page__title { display: none; }
.research-hero h1 {
  color: #4b4b4b; /* Light theme: dark gray */
  font-size: 2.4em;
  font-weight: 800;
  margin: 0 0 0.2em 0;
}
.research-hero hr {
  border: 0;
  height: 3px;
  background: #c0c0c0;
  margin: 0.3em 0 1em 0;
}

/* Dark theme: use same white as body text */
html[data-theme="dark"] .research-hero h1 {
  color: var(--global-text-color);
}
</style>

<div class="research-hero">
  <h1>Research</h1>
  <hr />
</div>

## AI-Driven Many-Body Frameworks

I have developed a unified theoretical framework that integrates **Deep Learning** with microscopic models to solve the quantum many-body problem.
<img src="{{ base_path }}/images/ctrlNN.png" alt="Control NN Diagram" width="100%" />

*   **Methodology:** I constructed the **CB-Hyper-Brink model**, which introduces complex generator coordinates to capture cluster-breaking effects, spin-orbit coupling, and high-momentum correlations within a fully antisymmetrized framework. To navigate the immense Hilbert space of non-orthogonal bases, I pioneered the **Control Neural Network (Ctrl.NN)** method, an AI agent that autonomously constructs and optimizes wave functions via physical variational principles.

*   **Applications:** This approach has successfully described the structure of light hypernuclei, such as the rotational bands of $$^{9-11}_{\Lambda}\text{Be}$$ isotopes and the parity-mixed spectroscopy of $$^{12}_{\Lambda}\text{B}$$, revealing the interplay between cluster dynamics and $$\Lambda$$-induced core shrinkage.

## Ab Initio Few-Body Hypernuclear Physics

Moving forward, I am expanding my research into **ab initio calculations of few-body hypernuclear systems** using the **Gaussian Expansion Method (GEM)**.
<img src="{{ base_path }}/images/mechanism_doctor.png" alt="Control NN Diagram" width="100%" />
*   **Goal:** By leveraging the high precision of GEM in handling complicated strong interaction and exotic structures, I aim to rigorously solve 3- to 5-body hypernuclear systems and extend the framework to handle **$A \ge 6$ systems**. A core focus is modeling **explicit $\Lambda - \Sigma$ coupling dynamics** and engaging realistic baryonic interactions, which are crucial for interpreting binding energies and level spacings.

*   **Impact:** This research provides distinct **insights into baryonic matter**. By bridging microscopic Hyperon-Nucleon interactions to observables, it deepens our quantitative understanding of the strong force in the strangeness sector and contributes to solving the **Hyperon Puzzle** in neutron stars.
