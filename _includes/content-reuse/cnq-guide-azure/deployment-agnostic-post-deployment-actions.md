<a id="perform-post-deployment-actions"></a>
## Step 3: Performing Post-Deployment Actions
This section describes the common actions you can perform on a {{site.cnqShort}} cluster after deploying it.

<a id="adding-node-to-existing-cluster"></a>
### Adding a Node to an Existing Cluster
{% include important.html content="To add a node to an existing cluster, the total node count must be greater than that of the current deployment." %}

1. {{site.cnq.changeQnodeCountAzure}} to a new value.
1. {{site.cnq.runTFapply}}
1. {{site.cnq.tfDispExecPlan}}

   {{site.cnq.reviewExecPlan}}

   Terraform changes resources according the execution plan and displays an additional primary (static) IP for the new node. For example:

   ```
   qumulo_primary_ips = [
     "{{site.exampleIP1}}",
     "{{site.exampleIP2}}",
     "{{site.exampleIP3}}",
     "{{site.exampleIP4}}",
     "{{site.exampleIP5}}"
   ]
   ```
{% capture verifyProvis %}To ensure that the Provisioner shut downs automatically, review the `last-run-status` parameter {{site.cnq.azureAppConfig}}.{% endcapture %}
1. {{verifyProvis}}
1. {{site.cnq.logIntoWebUI}}

<a id="increasing-soft-capacity-limit-existing-cluster"></a>
### Increasing the Soft Capacity Limit for an Existing Cluster
Increasing the soft capacity limit for an existing cluster is a two-step process:

1. Configure new persistent storage parameters.
2. Configure new compute and cache deployment parameters.

#### Step 1: Set New Persistent Storage Parameters
1. Edit the `terraform.tfvars` file in the `persistent-storage` directory and set the `q_cluster_soft_capacity_limit` variable to a higher value.
1. {{site.cnq.runTFapply}}

   {{site.cnq.reviewExecPlan}}

   {{site.cnq.tfCreatesNewStorageAccounts}} and displays:

   * The names of the created persistent storage accounts

   * Your persistent storage resource group's unique name

   * The new soft capacity limit

   For example:

   ```
   Outputs:

   persistent_storage_accounts = [
     "{{site.exampleStorageAccountName1}}",
     "{{site.exampleStorageAccountName2}}",
     "{{site.exampleStorageAccountName3}}",
     "{{site.exampleStorageAccountName4}}",
   ]
   persistent_storage_resource_group = "{{site.cnq.persistentStorageResourceGroupAzure}}"
   ...
   soft_capacity_limit = "1000 TB"
   ```

#### Step 2: Update Existing Compute and Cache Resource Deployment
1. Navigate to the root directory of the `azure-terraform-cnq-<x.y>` repository.
1. {{site.cnq.runTFapplyWithFile}}

   {{site.cnq.reviewExecPlan}}

   Terraform updates the necessary roles and Azure Storage Account policies, adds Azure Storage Accounts to the persistent storage list for the cluster, increases the soft capacity limit, and displays the `Apply complete!` message.

   When the Provisioner shuts down automatically, this process is complete.

<a id="deleting-existing-cluster"></a>
### Deleting an Existing Cluster
Deleting a cluster is a two-step process:

1. Delete your {{site.cnqLong}} resources.
1. Delete your persistent storage.

{{site.data.alerts.caution}}
<ul>
  <li>When you no longer need your cluster, you must back up all important data on the cluster safely before deleting the cluster.</li>
  <li>When you delete your cluster's cache and computer resources, it isn't possible to access your persistent storage anymore.</li>
</ul>
{{site.data.alerts.end}}

#### Step 1: To Delete Your Cluster's {{site.cnqLong}} Resources
1. Back up your data safely.
1. {{site.cnq.runTFdestroy}}

   {{site.cnq.reviewExecPlan}}

   Terraform deletes all of your cluster's {{site.cnqShort}} resources and displays the `Destroy complete!` message and a count of destroyed resources.

#### Step 2: To Delete Your Cluster's Persistent Storage
1. Navigate to the `persistent-storage` directory.

1. {{site.cnq.runTFdestroy}}

   {{site.cnq.reviewExecPlan}}

   Terraform deletes all of your cluster's persistent storage and displays the `Destroy complete!` message and a count of destroyed resources.
