---
title: "Wiring Nodes and Networking Your HPE Alletra 4110 Cluster"
summary: "This section explains how to wire NIC ports on HPE Alletra 4110 nodes and how to network a cluster."
permalink: /hardware-guide/hpe-alletra-4110/wiring-nodes-networking-cluster.html
sidebar: hardware_guide_sidebar
platform: all4110
---

{% include important.html content="For your node to work correctly, you must connect at least one port in the NIC." %}

## Node NICs and Ports
{% include content-reuse/run-anywhere-conditional-admonitions.md %}

The following diagrams show the NICs and ports on {{site.all4110}} node types.

{% capture alt_tag %}Back Diagram of the {{site.all4110}} Node{% endcapture %}
{% include image.html alt=alt_tag file="hpe-alletra-4110-back-diagram.png" url="/hardware-guide/hpe-alletra-4110/images/hpe-alletra-4110-back-diagram.png" %}

{% include content-reuse/platform-agnostic-split-wiring-networking-cluster.md ethernetSpeed="100 Gbps" %}
