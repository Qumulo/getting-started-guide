---
title: "Configuring the Intelligent Platform Management Interface (IPMI) and Wiring Your Supermicro A+ ASG-1014S-ACR12N4H Nodes"
summary: "This section explains how to wire the out-of-band management (IPMI) port, 25 Gbps or 100 Gbps ports, and power on Supermicro 1014S nodes."
permalink: /hardware-guide/supermicro-a-plus-asg-1014s-acr12n4h/configuring-ipmi-wiring-nodes.html
redirect_from: /hardware-guide/supermicro-a-plus-asg-1014s-acr12n4h/wiring-nodes.html
  - /hardware-guide/supermicro-a-plus-asg-1014s-acr12n4h/wiring-nodes.html
  - /hardware/supermicro-a-plus-asg-1014s-acr12n4h/wiring-nodes.html
sidebar: hardware_guide_sidebar
---

{{site.unifyNetDefine}}

{% capture unusedPorts %}{{site.unusedEthPorts}}{% endcapture %}
{% include note.html content=unusedPorts %}

{% capture alt_tag %}Back Diagram of the {{site.sm1014sLong}} Node{% endcapture %}
{% include image.html alt=alt_tag file="supermicro-1014s-back-diagram.png" url="/hardware-guide/supermicro-a-plus-asg-1014s-acr12n4h/images/supermicro-1014s-back-diagram.png" %}

{% include content-reuse/hardware-guides/platform-agnostic-ipmi.md %}
{{site.hardware.ipmiConfig.smc}}

{% include content-reuse/hardware-guides/platform-agnostic-unified-networking-wiring.md bmcType="IPMI" ethernetSpeed="25 Gbps or 100 Gbps" portCompatibility=" (compatible with QSFP28 and QSFP56)" %}

{% include content-reuse/hardware-guides/platform-agnostic-unified-networking-wiring-power.md ethernetSpeed="25 Gbps or 100 Gbps" %}
