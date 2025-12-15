---
layout: archive
title: "Curriculum Vitae"
permalink: /cv/
author_profile: true
redirect_from:
  - /resume
---

{% include base_path %}

<style>
/* Hide default title rendered by layout on this page only */
.page__title { display: none; }
.cv-hero h1 {
  color: #001f3f;
  font-size: 2.4em;
  font-weight: 800;
  margin: 0 0 0.2em 0;
}
.cv-hero hr {
  border: 0;
  height: 3px;
  background: #a0a0a0;
  margin: 0.3em 0 1em 0;
}
.cv-pub-title a {
  color: #001f3f;
  font-size: 1.08em;
  font-weight: 700;
  text-decoration: none;
}
.cv-pub-title a:hover {
  text-decoration: underline;
}
.cv-pub-cite {
  font-size: 1.02em;
}
.talk-title-cv a {
  font-size: 1.08em;
  font-weight: 700;
}
.talk-venue-cv {
  font-size: 1.02em;
}
.cv-talk-date {
  font-size: 1.01em;
  color: #444;
}
</style>

<div class="cv-hero">
  <h1>Curriculum Vitae</h1>
  <hr />
</div>

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


Contact
======
* Email: jiaqi.tian.np@outlook.com

Education
======
* Joint research student, High Energy Accelerator Research Organization (KEK), **Jul. 2025 – Feb. 2026**
* M.S. in Physics, College of Physics, Nanjing University of Aeronautics and Astronautics, **Sep. 2023 – now**
* B.S. in Applied Physics, College of Physics, Nanjing University of Aeronautics and Astronautics, **Sep. 2019 – Jun. 2023**

Awards
======
<ul>
{% assign awards = site.data.news | where: "tag", "Award" | sort: "sort_key" | reverse %}
{% for item in awards %}
  <li>
    <strong>{{ item.year }}.{{ item.month | prepend: '0' | slice: -2, 2 }}.{{ item.day | prepend: '0' | slice: -2, 2 }}</strong> –
    {% assign title = item.award_title | default: item.description %}
    {% assign source = item.award_source %}
    {% if item.link_text and item.link_url %}
      <strong><a href="{{ item.link_url }}" target="_blank" rel="noopener">{{ title }}</a></strong>{% if source %}, {{ source }}{% endif %}
    {% else %}
      <strong>{{ title }}</strong>{% if source %}, {{ source }}{% endif %}
    {% endif %}
  </li>
{% endfor %}
</ul>

<!-- Work experience
======
* Spring 2024: Academic Pages Collaborator
  * GitHub University
  * Duties includes: Updates and improvements to template
  * Supervisor: The Users

* Fall 2015: Research Assistant
  * GitHub University
  * Duties included: Merging pull requests
  * Supervisor: Professor Hub

* Summer 2015: Research Assistant
  * GitHub University
  * Duties included: Tagging issues
  * Supervisor: Professor Git
  
Skills
======
* Skill 1
* Skill 2
  * Sub-skill 2.1
  * Sub-skill 2.2
  * Sub-skill 2.3
* Skill 3 -->

Publications
======
  <ul>{% for post in site.publications reversed %}
    {% include archive-single-cv.html %}
  {% endfor %}</ul>
  
Talks
======
  <ul>{% for post in site.talks reversed %}
    {% include archive-single-talk-cv.html  %}
  {% endfor %}</ul>
  
<!-- Teaching
======
  <ul>{% for post in site.teaching reversed %}
    {% include archive-single-cv.html %}
  {% endfor %}</ul>
  
Service and leadership
======
* Currently signed in to 43 different slack teams -->
