---
title: Papers
layout: single
class: wide
permalink: /papers/
---



{% for category in site.data.papers.categories %}
  <h2>{{category.heading}}</h2>
  <ol>
  {% for paper in category.pubs %}
    <table>
      <td style="width:20%">
      {% if paper.links %}
        {% for link in paper.links limit:1 %}
        <a href="{{link.url}}">
          <img src=
              "{{ paper.image_path }}"
              width="200" height="200"
          >
        </a>
        {% endfor %} 
      {% else %}
          <img src=
              "{{ paper.image_path }}"
              width="200" height="200"
          >
      {% endif %}
      </td>
      <td>
        <li><strong>{{paper.title}}</strong>.
        <br>
        {% for auth in paper.author %}
          {% if forloop.last %}
            {{auth}}.
        {% else %}
            {{auth}},
        {% endif %}
        {% endfor %}
        <br>
        <em>{{paper.journal}}</em>, 
        {% if paper.volume and paper.number%}
          {{paper.volume}}({{paper.number}}),
        {% endif %}
        ({{paper.year}}).
        {% if paper.url %}
        <br>
          [<a href="{{paper.url}}">{{paper.url}}</a>] 
        {% endif %}
        </li>
      </td>
    </table>
    {% endfor %}
{% endfor %}
  </ol>
