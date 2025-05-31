---
title: "Identities"
description: "This page contains my accounts and public keys I use."
short_desc: "Identities and public keys I use"
permalink: /identities/
---

## Platforms

I'm available at the following places:

<!-- markdownlint-disable MD007 MD032 -->

{%- for a in site.data.accounts %}
  - [{{ a.name }} @{{ a.username }}]({{ a.url }})
{%- endfor %}

<!-- markdownlint-enable MD007 MD032 -->

I don't have a Facebook, Instagram, Threads or Twitter account.

## Encryption

My past and present PGP keys:  
I no longer sign my Git commits with PGP.

{% include terminal.html task="pgp" %}

## SSH Keys

I currently sign my Git commits with SSH:

{% include terminal.html task="ssh" %}
