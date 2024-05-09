---
title: "Getting Started with Qumulo on Supermicro A+ ASG-2015S-E1CR24L"
summary: "This section explains how to prepare Supermicro 2015S nodes for creating a Qumulo cluster."
permalink: /hardware-guide/supermicro-a-plus-asg-2015s-e1cr24l/getting-started.html
sidebar: hardware_guide_sidebar
---

## Step 1: Verify Your Node

{% include content-reuse/platform-agnostic-verify-node-preamble.md %}

   {% capture alt_tag %}Front Diagram of the {{site.sm2015sLong}} Node{% endcapture %}
   {% include image.html alt=alt_tag file="supermicro-1014s-front-diagram.png" url="/hardware-guide/supermicro-a-plus-asg-2015s-e1cr24l/images/supermicro-1014s-front-diagram.png" %}


## Step 2: Boot by Using the Qumulo Core USB Drive Installer

1. When the node powers on and begins to boot, on the **Supermicro** screen, press **F11**.

   {% include note.html content="The boot setting is persistent: When you boot from a USB drive once, the node continues to boot from the USB drive. After you finish installing Qumulo Core, remove the USB drive from the node." %}

1. On the **Please select boot device:** screen, select your USB drive (usually labeled with `UEFI OS`) and boot into it.


## Step 3: Install Qumulo Core

{% include content-reuse/install-qumulo-core.md %}
   

## Step 4: Create and Configure Your Cluster

{% include content-reuse/create-configure-cluster.md %}