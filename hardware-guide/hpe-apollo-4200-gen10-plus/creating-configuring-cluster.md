---
title: "Creating and Configuring a Qumulo Cluster with HPE Apollo 4200 Gen10 Plus Nodes"
summary: "This section explains how to prepare HPE Apollo 4200 Gen10 Plus nodes for creating a Qumulo cluster. This guide is for system administrators, professional service providers, and colleagues in your organization who are responsible for installing and configuring server hardware."
permalink: /hardware-guide/hpe-apollo-4200-gen10-plus/creating-configuring-cluster.html
redirect_from:
  - /hardware-guide/hpe-apollo-4200-gen10-plus/getting-started.html
sidebar: hardware_guide_sidebar
---

## Prerequisites
{{site.xrefUSBinstaller}}

## Step 1: Verify Your Node

{% include content-reuse/hardware-guides/platform-agnostic-verify-node-preamble.md %}

## Step 2: Boot by Using the Qumulo Core USB Drive Installer

1. On the **HPE ProLiant** boot screen, press **F11**.

   {% include note.html content="The **Boot Menu** page might take a few minutes to appear." %}

1. On the **One-Time Boot Menu** page, click **Generic USB Boot** and continue to run the Field Verification Tool (FVT).


## Step 3: Run the Field Verification Tool (FVT)

After the node reboots, the Field Verification Tool runs automatically.

Select **[1] Factory reset (DESTROYS ALL DATA)** and then enter `DESTROY ALL DATA`.


### Fixable Issues During Installation
If the FVT finds fixable issues, it prompts you to auto-correct any detected issues, depending on your installation scenario. Issues that the FVT can auto-correct include the following:

* BIOS Configuration
* Drive firmware
* Drive controller firmware
* NIC mode for CX5
* Boot order

1. To attempt auto-correction, select **[1] Run FVT Flash. This will try to fix issues then reboot.**

   If the fixes are successful, the FVT reboots the node automatically.

1. To re-attempt verification, [boot by using the Qumulo Core USB Drive Installer](#step-2-boot-by-using-the-qumulo-core-usb-drive-installer) and then continue the installation.


### Non-Fixable Issues
If the FVT is unable to auto-correct any issues, the message **Not fixable issues were detected.** appears, providing reasons for failure.

For help with troubleshooting your node, {{site.contactQumuloCare}}.

   
## Step 4: Create and Configure Your Cluster

{% include content-reuse/hardware-guides/create-configure-cluster.md %}
