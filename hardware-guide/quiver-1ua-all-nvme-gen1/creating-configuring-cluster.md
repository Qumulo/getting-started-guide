---
title: "Creating and Configuring a Qumulo Cluster with Quiver 1U All-NVMe Gen1 Nodes"
summary: "This section explains how to prepare Quiver 1UA Gen1 nodes for creating a Qumulo cluster."
permalink: /hardware-guide/quiver-1ua-all-nvme-gen1/creating-configuring-cluster.html
redirect_from:
  - /hardware-guide/quiver-1ua-all-nvme-gen1/getting-started.html
sidebar: hardware_guide_sidebar
platform:
  - quiver
  - q1uag1
---

## Step 1: Verify Your Node
{% include content-reuse/hardware-guides/platform-agnostic-verify-node-preamble.md %}


## Step 2: Boot by Using the Qumulo Core USB Drive Installer
1. When the node powers on and begins to boot, on the **ASUS** screen, press **F8**.

   {{site.data.alerts.note}}
   <ul>
     <li>The boot setting is persistent: When you boot from a USB drive once, the node continues to boot from the USB drive. After you finish installing Qumulo Core, remove the USB drive from the node.</li>
     <li>Depending on your node configuration, it might take longer than usual to boot up for the first time.</li>
   </ul>
   {{site.data.alerts.end}}

1. On the **Please select boot device:** screen, select your USB drive (usually labeled with `UEFI OS`) and boot into it.

   The Qumulo Core installation begins.
   

## Step 3: Create and Configure Your Cluster
{% include content-reuse/hardware-guides/run-anywhere-conditional-admonitions.md %}

{% include content-reuse/hardware-guides/create-configure-cluster.md %}
