---
title: "Wiring Nodes and Networking Your HPE Alletra 4110 Cluster"
summary: "This section explains how to wire NIC ports on HPE Alletra 4110 nodes and how to network a cluster."
permalink: /hardware-guide/hpe-alletra-4110/wiring-nodes-networking-cluster.html
sidebar: hardware_guide_sidebar
platform:
  - hpe
  - all4110
---

{% include content-reuse/hardware-guides/platform-agnostic-identify-eth-port.md %}

## Node NICs and Ports
{% include content-reuse/hardware-guides/run-anywhere-conditional-admonitions.md %}

The following diagrams show the NICs and ports on {{site.all4110}} node types.

{% capture alt_tag %}Back Diagram of the {{site.all4110}} Node{% endcapture %}
{% include image.html alt=alt_tag file="hpe-alletra-4110-back-diagram.png" url="/hardware-guide/hpe-alletra-4110/images/hpe-alletra-4110-back-diagram.png" %}

{% include content-reuse/hardware-guides/platform-agnostic-split-wiring-networking-cluster.md ethernetSpeed="100 Gbps" %}

{% include important.html content="For your node to work correctly, you must connect at least one port in the NIC." %}
