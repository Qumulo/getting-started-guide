---
title: "Replacing Hardware Components in Your Quiver 2U Hybrid Gen2 Nodes"
summary: "This section explains how to replace hardware components in Quiver 2U Hybrid Gen2 nodes."
permalink: /hardware-guide/quiver-2u-hybrid-gen2/replacing-hardware-components.html
sidebar: hardware_guide_sidebar
varRemovePCIeCard: <a href="#replace-pci-e-riser-card">Remove the PCIe card from the motherboard.</a>
varHotPlug: You can replace this component without powering off the node.
varNoHotPlug: To replace this component, you must first power off the node.
platform:
  - quiver
  - q2uhg2
---

For detailed hardware replacement instructions, see <a href="https://docs.qumulo.com/pdf/quiver-2uh-hybrid-rackmount-chassis-user-manual.pdf#page=11" class="pdf">RSC-2MS Rackmount Chassis User's Manual</a> {{site.hardware.fromAIC}}.

{% include content-reuse/platform-agnostic-part-replacement-admonitions.md %}

## To Remove and Replace the Top Cover
Follow the instructions in the SC-2MS Rackmount Chassis User's Manual: <a href="https://docs.qumulo.com/pdf/quiver-2uh-hybrid-rackmount-chassis-user-manual.pdf#page=13" class="pdf">Top Cover (p. 13)</a>.


## To Initialize the Replacement M.2 Boot Drive
{{site.bootDriveInit}} For more information, see [NVMe M.2 Boot Drive](drive-bay-mapping.html#nvme-m2-boot-drive).

{% include content-reuse/platform-agnostic-boot-drive-replacement.md %}


## To Replace an HDD
Your {{site.q2uhg2}} chassis contains 24 HDDs. For more information, see [Internal HDD Drives](drive-bay-mapping.html#internal-hdd-drives).

Follow the instructions in the SC-2MS Rackmount Chassis User's Manual: <a href="https://docs.qumulo.com/pdf/quiver-2uh-hybrid-rackmount-chassis-user-manual.pdf#page=16" class="pdf">Hard Disk Drive (p. 16)</a>.


## To Replace a Power Supply Unit (PSU)
Follow the instructions in the SC-2MS Rackmount Chassis User's Manual: <a href="https://docs.qumulo.com/pdf/quiver-2uh-hybrid-rackmount-chassis-user-manual.pdf#page=14" class="pdf">Power Supply Unit Module (p. 14)</a>.


## To Replace a Fan Module
Follow the instructions in the SC-2MS Rackmount Chassis User's Manual: <a href="https://docs.qumulo.com/pdf/quiver-2uh-hybrid-rackmount-chassis-user-manual.pdf#page=15" class="pdf">Fan Module (p. 15)</a>.


## To Replace the Node Chassis
{% include important.html content="After you perform a chassis swap, you must reconfigure the IPMI settings for your node." %}

1. Remove the existing components from the chassis.

1. Install the new components in the chassis.

{% include content-reuse/platform-agnostic-part-replacement-procedure-fvt.md %}
