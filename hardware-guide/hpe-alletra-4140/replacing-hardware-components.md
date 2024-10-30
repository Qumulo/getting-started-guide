---
title: "Replacing Hardware Components in Your HPE Alletra 4140 Nodes"
summary: "This section explains how to replace hardware components in HPE Alletra 4140 nodes."
permalink: /hardware-guide/hpe-alletra-4140/replacing-hardware-components.html
sidebar: hardware_guide_sidebar
platform: hpe
---

{% include content-reuse/platform-agnostic-part-replacement-admonitions.md %}

{% include content-reuse/platform-agnostic-part-replacement-procedure-fvt.md %}

## To Replace a HDD or SSD NVMe Drive
Your {{site.all4140}} chassis contains either 60 or 80 HDDs and 8 SSD NVMe drives.

For information about replacing an HDD or SSD NVMe drive, see [Storage Drives (HDD and SSD NVMe)](https://support.hpe.com/hpesc/public/docDisplay?docId=sd00003806en_us&page=GUID-95022634-89E1-4F6B-8838-AEEA4CDFE580.html) in the HPE documentation.

## To Replace an M.2 Boot Drive
Your {{site.all4140}} chassis contains one NVMe boot drive in an internal M.2 expansion slot.

For information about replacing an M.2 boot drive, see [Installing an M.2 Solid State Drive](https://support.hpe.com/hpesc/public/docDisplay?docId=sd00003806en_us&page=GUID-F7B91A13-8AAC-4D4A-8967-FDAD49FF979A.html) in the HPE documentation.

## To Replace a Power Supply Unit (PSU)
Your {{site.all4140}} chassis contains two PSUs.

For information about replacing a PSU, see [Power Supply](https://support.hpe.com/hpesc/public/docDisplay?docId=sd00003806en_us&page=GUID-1C979785-9936-4111-A087-E60603735600.html) in the HPE documentation.

## To Replace a Fan
Your {{site.all4140}} chassis has six internal fans.

For information about replacing a fan, see [System Fans](https://support.hpe.com/hpesc/public/docDisplay?docId=sd00003806en_us&page=GUID-1EB111DC-A768-4208-BC76-4E1F66BD4E5A.html) in the HPE documentation.

## To Replace a DIMM
Your {{site.all4140}} chassis has 24 DIMM slots.

For information about replacing a DIMM, see [DIMM Installation](https://support.hpe.com/hpesc/public/docDisplay?docId=sd00003806en_us&page=GUID-2C32FA8F-C3F5-4291-9810-0AB9842847BF.html) in the HPE documentation.

{% include note.html content="To identify which DIMM failed, you must use the baseboard management controller (BMC) on the node or another hardware monitoring solution." %}
