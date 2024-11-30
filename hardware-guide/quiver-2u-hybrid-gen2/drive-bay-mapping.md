---
title: "Drive Bay Mapping in Quiver 2U Hybrid Gen2 Nodes"
summary: "This section explains the drive bay mapping in Quiver 2UH Gen2 nodes."
permalink: /hardware-guide/quiver-2u-hybrid-gen2/drive-bay-mapping.html
sidebar: hardware_guide_sidebar
---

The {{site.q2uhg2}} chassis contains 24 HDD drives in internal drawers, 6 NVMe drives at the back of the node, and one boot drive in an internal M.2 expansion slot.

{{site.data.alerts.tip}}<ul><li><p>To check that the node has detected all of the drives, run the following command:</p><div class="language-bash highlighter-rouge"><div class="highlight"><pre class="highlight manual"><code>/opt/MegaRAID/storcli/storcli64 /c0 show | \
  grep "Physical"</code></pre></div></div></li><li>To show the number of detected NVMe drives, run the <code>nvme list</code> command.</li></ul>{{site.data.alerts.end}}

## Internal HDD Drives
The HDD drives in the {{site.q2uhg2}} chassis are located in three drawers.

### Drawer 1 (Drives 1-8)
{% capture alt_tag %}{{site.q2uhg2Long}} HDD Bay Mapping: Drawer 1{% endcapture %}
{% include image.html alt=alt_tag file="quiver-2u-hybrid-gen2-hdd-bay-mapping-drawer-1.png" max-width="350" %}

### Drawer 2 (Drives 9-16)
{% capture alt_tag %}{{site.q2uhg2Long}} HDD Bay Mapping: Drawer 2{% endcapture %}
{% include image.html alt=alt_tag file="quiver-2u-hybrid-gen2-hdd-bay-mapping-drawer-2.png" max-width="350" %}

### Drawer 3 (Drives 17-24)
{% capture alt_tag %}{{site.q2uhg2Long}} HDD Bay Mapping: Drawer 3{% endcapture %}
{% include image.html alt=alt_tag file="quiver-2u-hybrid-gen2-hdd-bay-mapping-drawer-3.png" max-width="350" %}


## Rear NVMe Drives
The NVMe drives in the {{site.q2uhg2}} are located at the back of the node.

{% capture alt_tag_nvme %}{{site.q2uhg2Long}}}} NVMe Drive Bay Mapping{% endcapture %}
{% include image.html alt=alt_tag_nvme file="quiver-2u-hybrid-gen2-nvme-drive-bay-mapping.png" url="/hardware-guide/quiver-2u-hybrid-gen2/images/quiver-2u-hybrid-gen2-nvme-drive-bay-mapping.png" %}


## NVMe M.2 Boot Drive
The boot drive is located at the M.2 expansion slot at Riser Slot 1.

{% capture alt_tag_nvme %}{{site.q2uhg2Long}}}} NVMe Boot Drive Location{% endcapture %}
{% include image.html alt=alt_tag_nvme file="quiver-2u-hybrid-gen2-nvme-boot-drive-location.png" %}
