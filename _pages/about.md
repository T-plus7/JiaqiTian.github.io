---
permalink: /
title: "Jiaqi Tian"
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---


• Joint research student\\
KEK Theory Center, High Energy Accelerator Research Organization (KEK)\\
• Master student\\
College of Physics, Nanjing University of Aeronautics and Astronautics  

E-mail: jiaqi.tian@nuaa.edu.cn\\
E-mail: jiaqi.tian.np@outlook.com

I currently work on nuclear and hypernuclear structure, focusing on clustering phenomena and neural-network–assisted microscopic calculations.

News
------
<style>
.news-tag {
  display: inline-block;
  padding: 3px 10px;
  margin-right: 10px;
  border-radius: 4px;
  font-size: 0.9em;
  font-weight: 600;
  color: white;
  vertical-align: middle;
}
.news-tag-green { background-color: #28a745; }
.news-tag-dark-gray { background-color: #6c757d; }
.news-tag-red { background-color: #dc3545; }
.news-tag-gold { background-color: #ffc107; color: #333; }
.news-tag-purple { background-color: #8a2be2; }
.news-year { font-size: 1.2em; font-weight: 700; margin-top: 1.2rem; margin-bottom: 0.4rem; }
.news-list { list-style: none; padding-left: 0; margin-bottom: 1rem; }
.news-list li { margin-bottom: 0.8em; line-height: 1.6; }
.news-description a { color: #52adc8; text-decoration: none; }
.news-description a:hover { text-decoration: underline; }
</style>

{% assign news_by_year = site.data.news | group_by: "year" | sort: "name" | reverse %}
{% for year_group in news_by_year %}
  <div class="news-year">{{ year_group.name }}</div>
  <ul class="news-list">
    {% assign sorted_items = year_group.items | sort: "sort_key" | reverse %}
    {% for item in sorted_items %}
      <li>
        <span class="news-tag news-tag-{{ item.tag_color | default: 'red' }}">{{ item.tag }}</span>
        <strong>{{ item.year }}.{{ item.month | prepend: '0' | slice: -2, 2 }}.{{ item.day | prepend: '0' | slice: -2, 2 }}：</strong>
        <span class="news-description">
          {% if item.link_text and item.link_url %}
            {% assign desc_parts = item.description | split: item.link_text %}
            {{ desc_parts[0] }}<a href="{{ item.link_url }}" target="_blank" rel="noopener">{{ item.link_text }}</a>{% if desc_parts.size > 1 %}{{ desc_parts[1] }}{% endif %}
          {% else %}
            {{ item.description }}
          {% endif %}
        </span>
      </li>
    {% endfor %}
  </ul>
{% endfor %}
