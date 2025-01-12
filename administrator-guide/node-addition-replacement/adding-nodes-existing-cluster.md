---
title: "Adding Nodes to an Existing Qumulo Cluster"
summary: "This section explains how to add new HPE, Supermicro, or Quiver nodes to an existing cluster."
permalink: /administrator-guide/node-addition-replacement/adding-nodes-existing-cluster.html
sidebar: administrator_guide_sidebar
---

After you connect and power on your new nodes, Qumulo Core discovers any unconfigured nodes automatically and prompts you to add nodes in the Qumulo Core Web UI.

If Qumulo Core doesn't discover any unconfigured nodes, it displays the message **No unconfigured nodes found**. If you expect to see nodes, {{site.contactQumuloCare}}.

{{site.data.alerts.note}}
<ul>
  <li>Qumulo Core requires a short time to update the total available storage.</li>
  <li>Existing nodes retain their numbering.</li>
</ul>
{{site.data.alerts.end}}


## Prerequisites
* **Sufficient Static IP Addresses:** The number of static IP addresses must be equal to or greater than the number of nodes in your cluster. For more information, see [IP Failover with Qumulo Core](https://care.qumulo.com/hc/en-us/articles/115007075107) on Qumulo Care.

* **Same Qumulo Core Version on All Nodes:** For information about upgrading Qumulo Core, see [Performing a Clean Installation of Qumulo Core](https://care.qumulo.com/hc/en-us/articles/360011477954) and [Performing Qumulo Core Upgrades](https://docs.qumulo.com/administrator-guide/upgrading-qumulo-core/performing-upgrades.html).


## Step 1: Resolve Drive Compatibility Issues
{{site.data.alerts.important}}
<ul>
  <li>{{site.hardware.platinumOnlyThis}}</li>
  <li>If the version of Qumulo Core on your existing nodes predates the Qumulo-certified drives that you received with your new nodes, you can't install a lower version of Qumulo Core on your new node and Qumulo Core displays the message <strong>Installation failed</strong>. Use the cluster logs to identify any incompatible drives.</li>
</ul>
{{site.data.alerts.end}}

To receive support for new, Qumulo-certified drives, do one of the following:

* Upgrade your existing cluster to the latest version of Qumulo Core and then install the same version of Qumulo Core on your new node. For more information, see [Upgrading Your Qumulo Cluster](../upgrading-qumulo-core/performing-upgrades.html).
  
* Update the Supported Drive List on your new node. For more information, {{site.contactQumuloCare}}.


## Step 2: Add Your New Nodes to an Existing Qumulo Cluster
1.  {{site.logIntoWebUI}}

1.  Click **Cluster &gt; Add Nodes**.

1.  On the **Add Nodes** page, select unconfigured nodes to add to your cluster.

1.  Click **Add Selected Nodes to Cluster**.
   
1.  In the **Add &lt;N&gt; nodes to cluster &lt;name&gt;?** dialog box, click **Yes**.

    If you add one or more node model types, a message reminds you about Qumulo Core adding a new model type to your cluster.

Qumulo Core configures your new nodes and adds them to your cluster.

On the **Cluster** page, the Qumulo Core Web UI shows the banner **Successfully added &lt;N&gt; nodes to the cluster** and the total available storage.
