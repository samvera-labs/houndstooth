---
layout: default
title: M3 Model Documentation
---

# {{ page.title }}

## Introduction

This is documentation of the M3 model. It is auto-generated from the YAML representation via the static website generator software [Jekyll](https://jekyllrb.com/). The file that generates this documentation is named `m3.yml` ([source](https://github.com/samvera-labs/houndstooth/blob/master/m3.yml)).  

## Administrative Information

### Profile  

Administrative information about the profile or model defined in the file.
<table>
<thead>
<tr>
<th>Property</th>
<th>Value</th>
</tr>
</thead>
{% for e in site.data.m3.profile %}
{% for item in e %}
{% if forloop.first %}<tr>{% endif %}
<td>{{item}}</td>
{% endfor %}
{% endfor %}
</table>

## Mapping Definitions

Definition of the mappings to different services or target schemas referenced in the profile.

{% for e in site.data.m3.mappings %}
  **{{ e[0] }}** - 
  {% for item in e %}{{ item.name }}{% endfor %}
{% endfor %}

## Class Definitions

Definition of the classes used in the profile.

<table>
<thead>
<tr>
<th>Class</th>
<th>Display Label</th>
<th>URI</th>
</tr>
</thead>
{% for e in site.data.m3.classes %}
{% for item in e %}
{% if item.display_label %}<tr><td>{{e[0]}}</td><td>{{item.display_label}}</td><td><a href="{{item.schema_uri}}">{{item.schema_uri}}</a></td></tr>{% endif %}
{% endfor %}
{% endfor %}
</table>

## Property Definitions

Definition of the properties used in the model.

{% for e in site.data.m3.properties %}
  **{{ e[0] }}** - 
  {% for item in e %}{{ item }}{% endfor %}
{% endfor %}
