---
title: "Replacing Hardware Components in Your Supermicro A+ ASG-2015S-E1CR24L Nodes"
summary: "This section provides basic stipulations regarding the replacement of certain hardware components in Supermicro 2015S nodes."
permalink: /hardware-guide/supermicro-a-plus-asg-2015s-e1cr24l/replacing-hardware-components.html
sidebar: hardware_guide_sidebar
---

For detailed hardware component replacement instructions, navigate to the <a href="https://www.supermicro.com/en/products/system/storage/2u/asg-2015s-e1cr24l">Storage A+ Server ASG-2015S-E1CR24L</a> in the Supermicro documentation, click **Resources & Downloads**, and then scroll down to the **User's Manuals** section.

{% include content-reuse/hardware-guide/platform-agnostic-part-replacement-admonitions.md %}

* **Motherboard:** {{site.partReplaceDcmsShort}}

* **NIC:** Qumulo Core doesn't require a minimum firmware version for a NIC. We recommend updating the firmware on a replacement NIC by following the recommendations in the Supermicro documentation.

* **HDD, NVMe, and Boot Drives:** For more information, see [Drive Bay Mapping](drive-bay-mapping.html) and [To Initialize a Replacement M.2 Boot Drive](#initialize-boot-drive).

* **DIMMs:** To identify which DIMM failed, you must use the baseboard management controller (BMC) on the node or another hardware monitoring solution.

<a id="initialize-boot-drive"></a>
## To Initialize a Replacement M.2 Boot Drive

{{site.bootDriveInit}}
  
{% include content-reuse/hardware-guide/platform-agnostic-boot-drive-replacement.md %}
