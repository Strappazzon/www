---
title: "Donate"
description: "Donation options."
permalink: /donate/
---

If you found what I do useful and want to support me, please consider making a donation.

All donations will go directly to me, not towards any specific project. Please note that there are no guarantees or expectations tied to your donation.

### Platforms

<!-- markdownlint-disable MD007 MD032 -->

{%- for p in site.data.donations.platforms %}
  - [{{ p.name }}]({{ p.url }})
    - {{ p.type }}
  {%- if p.currency %}
    - Amounts are in **{{ p.currency }}**
  {%- endif %}
{%- endfor %}

<!-- markdownlint-enable MD007 MD032 -->
