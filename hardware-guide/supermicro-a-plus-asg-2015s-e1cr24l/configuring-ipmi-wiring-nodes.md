---
title: "Configuring the Intelligent Platform Management Interface (IPMI) and Wiring Your Supermicro A+ ASG-2015S-E1CR24L Nodes"
summary: "This section explains how to wire the out-of-band management (IPMI) port, 25 Gbps or 100 Gbps ports, and power on Supermicro 2015S nodes."
permalink: /hardware-guide/supermicro-a-plus-asg-2015s-e1cr24l/configuring-ipmi-wiring-nodes.html
sidebar: hardware_guide_sidebar
---

{{site.unifyNetDefine}}

{% capture OneOrTwoNICs %}The most common configuration for a {{site.sm2015s}} node includes a single NIC in position 1, corresponding to the NIC (LAN1) LED on the front panel.{% endcapture %}
{% include note.html content=OneOrTwoNICs %}

{% capture alt_tag %}Back Diagram of the {{site.sm2015sLong}} Node{% endcapture %}
{% include image.html alt=alt_tag file="supermicro-2015s-back-diagram.png" %}

{% include content-reuse/hardware-guides/platform-agnostic-ipmi.md %}
{{site.hardware.ipmiConfig.smc}}

{% include content-reuse/hardware-guides/platform-agnostic-unified-networking-wiring.md bmcType="IPMI" ethernetSpeed="25 Gbps or 100 Gbps" portCompatibility=" (compatible with QSFP28 and QSFP56)" %}

{% include content-reuse/hardware-guides/platform-agnostic-unified-networking-wiring-power.md ethernetSpeed="25 Gbps or 100 Gbps" %}
