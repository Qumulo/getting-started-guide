---
title: "Installing VPN Keys on a Qumulo Cluster"
summary: "This section explains how to install VPN keys obtained from the Qumulo Care team on your Qumulo cluster, over a network. You can install the VPN keys by using the <code>qq</code> CLI from a machine on the same network as your cluster or from one of your nodes."
permalink: /administrator-guide/authentication-qumulo-core/installing-vpn-keys-on-cluster.html
redirect_from:
  - /administrator-guide/getting-started-qumulo-core/installing-vpn-keys-on-cluster.html
  - /administrator-guide/qumulo-core/installing-vpn-keys-on-cluster.html
sidebar: administrator_guide_sidebar
varCopyFile: 1. Copy the `.zip` file from Qumulo Care to a computer on the same network as your cluster, and decompress the file.
varVerifyKeys: 1. To verify that the VPN keys installed correctly, run the <a href="https://docs.qumulo.com/qq-cli-command-guide/node/node_state_get.html"><code>get_vpn_keys</code></a> command. For example&#58;
---

{% capture dontDoIt %}Follow these steps only if a member of the Qumulo Care team instructs you to do so. Performing these steps incorrectly can cause network performance, connectivity, and data integrity issues. It can also expose your cluster to unauthorized access. For help with this task, {{site.contactQumuloCare}}.{% endcapture %}
{% include caution.html content=dontDoIt %}

## Prerequisites
Before you begin, make sure that you have done the following.

* Obtain a `.zip` file with VPN keys from Qumulo Care

* Whitelist the following domains in your firewall rules:

  * `ep1.qumulo.com`

  * `api.missionq.qumulo.com`

  * `monitor.qumulo.com`

  * `api.nexus.qumulo.com`

* Permit outbound HTTPS traffic on port 443

{% include note.html content="If your firewall performs stateful packet inspection (also known as _SPI_ or _deep-packet inspection_), you must allow OpenVPN (SSL VPN) explicitly, rather than only open port 443." %}


## To Install VPN Keys from a Networked Machine
{{page.varCopyFile}}

1. Install the `qq` CLI on the same computer. For more information, see [Getting Started with the qq CLI](../qq-cli/getting-started.html).

1. To log in to your cluster, use the `qq` CLI and specify the IP address of a node in the cluster. For example:

   ```bash
   qq --host {{site.exampleIP0}} login
   ```
    
   {% include note.html content="Your user must have `PRIVILEGE_SUPPORT_WRITE` and `PRIVILEGE_SUPPORT_READ`." %}

1. To install the VPN keys on your cluster, specify your cluster's IP address and the path to the directory that contains the VPN keys. For example:

   ```bash
   qq --host {{site.exampleIP0}} install_vpn_keys /my/path
   ```
    
{{page.varVerifyKeys}}

   ```bash
   qq --host {{site.exampleIP0}} get_vpn_keys
   ```

1. Remove any local copies of the VPN key files.


## To Install VPN Keys from a Node
{% include note.html content="On macOS and Linux, you can use SCP and SSH. On Windows Server 2022, Windows Server 2019, and Windows 10 (build 1809 and higher), we recommend [installing OpenSSH](https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse)." %}

{{page.varCopyFile}}

1. To copy the VPN key files to one of your nodes, use SCP. For example:

   ```bash
   scp /my-path/* admin@{{site.exampleIP0}}:~/
   ```

1. To log in to the node to which you copied the VPN key files, use SSH. For example:

   ```bash
   ssh admin@{{site.exampleIP0}}
   ```

   The `qq` CLI is available to the admin user. For example:

   ```bash
   qq version
   ```

1. To install the VPN keys on your cluster, specify the path to the directory that contains the VPN keys. For example:
   
   ```bash
   sudo qq install_vpn_keys /my/path/
   ```
   
{{page.varVerifyKeys}}
   
   ```bash
   sudo qq get_vpn_keys
   ```
   

## To Register Cluster with Cloud-Based Monitoring

1. To retrieve your cluster ID, run the {% include qq.html command="node_state_get" %} command.

1. Send the output of the command to Qumulo Care.

1. Use the Qumulo Core Web UI to enable Qumulo Care Remote Support.

1. Notify Qumulo Care when this process is complete.

   Qumulo Care verifies your VPN functionality and then adds your cluster to Cloud-Based Monitoring.
