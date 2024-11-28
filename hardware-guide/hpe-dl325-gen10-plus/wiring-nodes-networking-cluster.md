---
title: "Wiring Nodes and Networking Your HPE ProLiant DL325 Gen10 Plus Cluster"
summary: "This section explains how to wire NIC ports on HPE ProLiant DL325 Gen10 Plus nodes and how to network a cluster."
permalink: /hardware-guide/hpe-dl325-gen10-plus/wiring-nodes-networking-cluster.html
redirect_from:
  - /hardware-guide/hpe-dl325-gen10-plus/networking-cluster.html
  - /hardware/hpe-dl325-gen10-plus/networking-cluster.html
sidebar: hardware_guide_sidebar
---

{{site.splitNetDefine}}

{% include content-reuse/platform-agnostic-identify-eth-port.md %}

## Node NICs and Ports
The following diagram shows the NICs and ports on {{site.dl325g10p}} nodes. On this platform, there are two sets of NICs, one for the front end and one for the back end.

{% capture alt_tag %}Front End (NIC1) and Back End (NIC2) ports on {{site.dl325g10p}} nodes.{% endcapture %}
{% include image.html alt=alt_tag file="dl325-rear-networking.png" %}

{% include content-reuse/platform-agnostic-split-wiring-networking-cluster.md ethernetSpeed="100 Gbps" %}

{% include important.html content="For your node to work correctly, you must connect at least one port in each NIC." %}
