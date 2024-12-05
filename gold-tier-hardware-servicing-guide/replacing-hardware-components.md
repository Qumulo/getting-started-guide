---
title: "Replacing Hardware Components in Your Nodes"
summary: "This section explains how to replace hardware components in your platform's nodes."
permalink: /gold-tier-hardware-servicing-guide/replacing-hardware-components.html
sidebar: gold_tier_hardware_servicing_guide_sidebar
---

For detailed instructions, see the documentation from your hardware vendor.


## Locating a Failed Drive
Gold-Tier hardware doesn't use predefined drive mapping or panel LEDs to indicate drive health.

### To Find the Serial Number for a Failed Drive

1. Log in to Qumulo Core.

1. Click **Cluster > Overview** and then click the name of the node with the failed drive.

1. On the page for the node, under **Product Serial**, the serial number is listed.


## Initializing a Replacement Boot Drive
{{site.bootDriveInit}}

### To Initialize the Replacement Boot Drive

{% include content-reuse/hardware-guides/platform-agnostic-boot-drive-replacement.md %}
