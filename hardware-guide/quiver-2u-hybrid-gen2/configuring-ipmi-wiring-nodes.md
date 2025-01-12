---
title: "Configuring the Intelligent Platform Management Interface (IPMI) and Wiring Your Quiver 2U Hybrid Gen2 Nodes"
summary: "This section explains how to wire the out-of-band management (IPMI) port, 25 Gbps or 100 Gbps ports, and power on Quiver 2UH Gen2 nodes."
permalink: /hardware-guide/quiver-2u-hybrid-gen2/configuring-ipmi-wiring-nodes.html
sidebar: hardware_guide_sidebar
---

{{site.unifyNetDefine}}

{% capture alt_tag %}Back Diagram of the {{site.q2uhg2Long}} Node{% endcapture %}
{% include image.html alt=alt_tag file="quiver-2u-hybrid-gen2-back-diagram.png" url="/hardware-guide/quiver-2u-hybrid-gen2/images/quiver-2u-hybrid-gen2-back-diagram.png" %}

{% include content-reuse/hardware-guides/platform-agnostic-ipmi.md %} To configure the IPMI port, you must use the BMC UI.

### To Configure the IPMI Port by Using ipmitool
Alternatively, you can configure the IPMI port by using `ipmitool`.

In the following examples, the `lan set 1` command specifies LAN channel 1.

1. To change the configuration from DHCP to static IP assignment, use the `ipsrc` subcommand. For example:

   ```bash
   ipmitool lan set 1 ipsrc static
   ```

1. To set the IP address, use the `ipaddr` subcommand. For example:

   ```bash
   ipmitool lan set 1 ipaddr {{site.exampleIP0}}
   ```

1. To set the subnet mask, use the `netmask` subcommand. For example:

   ```bash
   ipmitool lan set 1 netmask {{site.exampleSubnet1}}
   ```

1. To set the default gateway, use the `defgw` subcommand. For example:

   ```bash
   ipmitool lan set 1 defgw ipaddr {{site.exampleGateway1}}
   ````

1. To enable Address Resolution Protocol (ARP), which Qumulo Core often requires for `ping` to function properly, use the `arp` subcommand. For example:

   ```bash
   ipmitool lan set 1 arp respond on
   ```

1. To reset the BMC to allow the new configuration to take effect, run the `ipmitool mc reset cold` command.

{% include content-reuse/hardware-guides/platform-agnostic-unified-networking-wiring.md bmcType="iRMC" ethernetSpeed="25 Gbps or 100 Gbps" portCompatibility=" (compatible with QSFP28 and QSFP56)" %}

{% include content-reuse/hardware-guides/platform-agnostic-unified-networking-wiring-power.md ethernetSpeed="25 Gbps or 100 Gbps" %}
