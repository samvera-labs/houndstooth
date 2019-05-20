---
layout: default
title: Glorious Model
---

<header class="intro">
    <h1>{{ page.title }}</h1>
</header>

## Introduction
Some introduction text to the model  
  
## Administrative Information 
### Profile  
<table>
<thead>
<tr>
<th>Property</th>
<th>Example Value</th>
</tr>
</thead>
{% for e in site.data.m3.profile %}
{% for item in e %}
{% if forloop.first %}<tr>{% endif %}
<td>{{item}}</td>
{% if item == profile.version %}
{% break %}
{% endif %}
{% endfor %}
{% endfor %}
</table>

## Class Definitions
### Classes

<table>
<thead>
<tr>
<th>Display Label</th>
<th>Schema URI</th>
</tr>
</thead>
{% for e in site.data.m3.classes %}
<tr>
<td>{{e.display_label}}</td>
<td>{{e.schema_uri}}</td>
</tr>
{% endfor %}
</table>

## Property Definitions