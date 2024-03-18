---
title: Projects
layout: single
class: wide
permalink: /projects/
---

{% for project in site.data.projects.proj %}
  <table>
  <td>
  {% if project.embed %}
  <h3><a href="{{project.embed_url}}">{{project.title}}</a></h3>
  <iframe width="450" height="200" src="{{project.embed_url}}" style="-webkit-transform:scale(0.75);-moz-transform-scale(0.75);"></iframe>
  {% else %}
  <h3>{{project.title}}</h3>
  {% endif %}
  {% for link in project.links %}
  <small>[<a href="{{link.url}}">{{link.name}}</a>]</small>
  {% endfor %}
  </td>
  </table>
{% endfor %}