---
title: "Replacing Hardware Components in Your HPE Apollo Gen9 Nodes"
summary: "This section explains how to replace hardware components in HPE Apollo Gen9 nodes."
permalink: /hardware-guide/hpe-apollo-4200-gen9/replacing-hardware-components.html
sidebar: hardware_guide_sidebar
platform: hpe
---

{% include content-reuse/platform-agnostic-part-replacement-admonitions.md %}

{% include content-reuse/platform-agnostic-part-replacement-procedure-fvt.md %}

## To Replace a HDD or a SSD Drive
Your {{site.a4200g9}} chassis contains 24, 18, or 9 HDD drives and 9, 4, or 3 SSD drives. For more information, see [Front and Rear Drive Bays](front-rear-drives.html).

For information about replacing a HDD or SSD drive, see [Storage Drives (HDD or SSD)](https://support.hpe.com/resource3/docDisplay/pdfjs/web/viewer.html?file=%2Fhpesc%2Fpublic%2Fapi%2Fdocument%2Fc04718423%3Fv%3D1714776977000&locale=en-US&rangeChunkSize=256000&disableAutoFetch=false&disableCache=true&version=20240906085958&theme=light#%5B%7B%22num%22%3A708%2C%22gen%22%3A0%7D%2C%7B%22name%22%3A%22XYZ%22%7D%2C54%2C256%2Cnull%5D) in the HPE documentation.

## To Replace an M.2 Boot Drive
Your {{site.a4200g9}} chassis contains one boot drive. For more information, see [Boot Drive](front-rear-drives.html#boot-drive).

For information about replacing an M.2 boot drive, see [Installing an M.2 Solid State Drive](https://support.hpe.com/resource3/docDisplay/pdfjs/web/viewer.html?file=%2Fhpesc%2Fpublic%2Fapi%2Fdocument%2Fc04718423%3Fv%3D1714776977000&locale=en-US&rangeChunkSize=256000&disableAutoFetch=false&disableCache=true&version=20240906085958&theme=light#%5B%7B%22num%22%3A923%2C%22gen%22%3A0%7D%2C%7B%22name%22%3A%22XYZ%22%7D%2C54%2C276%2Cnull%5D) in the HPE documentation.

## To Replace a Power Supply Unit (PSU)
Your {{site.a4200g9}} chassis contains two PSUs.

For information about replacing a PSU, see [Power Supply](https://support.hpe.com/resource3/docDisplay/pdfjs/web/viewer.html?file=%2Fhpesc%2Fpublic%2Fapi%2Fdocument%2Fc04718423%3Fv%3D1714776977000&locale=en-US&rangeChunkSize=256000&disableAutoFetch=false&disableCache=true&version=20240906085958&theme=light#%5B%7B%22num%22%3A708%2C%22gen%22%3A0%7D%2C%7B%22name%22%3A%22XYZ%22%7D%2C54%2C256%2Cnull%5D) in the HPE documentation.

## To Replace a Fan
Your {{site.a4200g9}} chassis has internal fans.

For information about replacing a fan, see [System Fans](https://support.hpe.com/resource3/docDisplay/pdfjs/web/viewer.html?file=%2Fhpesc%2Fpublic%2Fapi%2Fdocument%2Fc04718423%3Fv%3D1714776977000&locale=en-US&rangeChunkSize=256000&disableAutoFetch=false&disableCache=true&version=20240906085958&theme=light#%5B%7B%22num%22%3A754%2C%22gen%22%3A0%7D%2C%7B%22name%22%3A%22XYZ%22%7D%2C54%2C357%2Cnull%5D) in the HPE documentation.

## To Replace a DIMM
Your {{site.a4200g9}} chassis has DIMM slots.

For information about replacing a DIMM, see [DIMM Installation](https://support.hpe.com/resource3/docDisplay/pdfjs/web/viewer.html?file=%2Fhpesc%2Fpublic%2Fapi%2Fdocument%2Fc04718423%3Fv%3D1714776977000&locale=en-US&rangeChunkSize=256000&disableAutoFetch=false&disableCache=true&version=20240906085958&theme=light#%5B%7B%22num%22%3A792%2C%22gen%22%3A0%7D%2C%7B%22name%22%3A%22XYZ%22%7D%2C54%2C745%2Cnull%5D) in the HPE documentation.

{% include note.html content="To identify which DIMM failed, you must use the baseboard management controller (BMC) on the node or another hardware monitoring solution." %}
