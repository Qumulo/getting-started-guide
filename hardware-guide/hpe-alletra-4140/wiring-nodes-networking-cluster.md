---
title: "Wiring Nodes and Networking Your HPE Alletra 4140 Cluster"
summary: "This section explains how to wire NIC ports on HPE Alletra 4140 nodes and how to network a cluster."
permalink: /hardware-guide/hpe-alletra-4140/wiring-nodes-networking-cluster.html
sidebar: hardware_guide_sidebar
---
{% include important.html content="For your node to work correctly, you must connect at least one port in the NIC." %}

{{site.unifyNetDefine}}

{% include content-reuse/hpe-apollo-4200-gen-9-90t-180t-288t-eops.md %}

## Node NICs and Ports
{% include content-reuse/platform-agnostic-unified-networking-cluster.md ethernetSpeed="10 Gbps or 25 Gbps"%}

{% include arbitrary_image.html alt="Platform-Agnostic Unified Networking Four-Node Cluster Architecture Diagram" file="../platform-agnostic/images/platform-agnostic-unified-networking-four-node-cluster.png" %}
