<a id="deploy-cluster-compute-and-cache-resources"></a>
## Step 2: Deploying Cluster Compute and Cache Resources
This section explains how to deploy compute and cache resources for a Qumulo cluster by using a Ubuntu AMI and the Qumulo Core `.deb` installer.

{{site.data.alerts.important}}
<ul>
{% if page.deployment == "cfn" %}
  <li>Only when the CloudFormation stack finishes running can you begin to monitor the Provisioner. {{site.cnq.paramStore}} Until the Provisioner shuts down automatically, the provisioning process isn't complete and the Qumulo cluster isn't yet functional.</li>  
{% elsif page.deployment == "tf" %}
  <li>Provisioning completes successfully when the Provisioner shuts down automatically. If the Provisioner doesn't shut down, the provisioning cycle has failed and you must troubleshoot it. To monitor the provisioner's status, you can watch the Terraform status posts in your terminal or monitor the Provisioner. {{site.cnq.paramStore}}.</li>
  <li>The first variable in the example configuration files in the <code>aws-terraform-cnq</code> repository is <code>deployment_name</code>. To help avoid conflicts between Network Load Balancers (NLBs), resource groups, cross-region CloudWatch views, and other deployment components, Terraform ignores the <code>deployment_name</code> value and any changes to it. Terraform generates the additional <code>deployment_unique_name</code> variable; appends a random, 11-digit alphanumeric value to it; and then tags all future resources with this variable, which never changes during subsequent Terraform deployments.</li>
{% endif %}  
  <li>If you plan to deploy multiple Qumulo clusters, give the <code>q_cluster_name</code> variable a unique name for each cluster.</li>
  <li>(Optional) If you use Amazon Route 53 <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/hosted-zones-private.html">private hosted zones</a>, give the <code>q_fqdn_name</code> variable a unique name for each cluster</li>
</ul>
{{site.data.alerts.end}}

1. Configure your VPC to use the gateway VPC endpoint for S3.

   {% include important.html content="It isn't possible to deploy your cluster without a gateway." %}

{% if page.deployment == "tf" %}
1. Navigate to the `aws-terraform-cnq-<x.y>` directory and then run the `terraform init` command.

   Terraform prepares the environment and displays the message `Terraform has been successfully initialized!`

1. Choose `config-standard.tfvars` or `config-advanced.tfvars` and fill in the values for all variables.

   For more information, see `README.pdf` in `aws-terraform-cnq-<x.y>.zip`.

1. {{site.cnq.runTFapplyWithFile}}

   {{site.cnq.tfDispExecPlan}}

1. {{site.cnq.reviewExecPlan}}

   Terraform creates resources according the execution plan and displays:

   * The `Apply complete!` message with a count of added resources
      
   * Your deployment's unique name
  
   * The names of the created S3 buckets
     
   * The floating IP addresses for your Qumulo cluster
     
   * The primary (static) IP addresses for your Qumulo cluster
     
   * The Qumulo Core Web UI endpoint
   
   For example:
   
   ```
   Apply complete! Resources: 62 added, 0 changed, 0 destroyed.
  
   Outputs:
  
   cluster_provisioned = "Success"
   deployment_unique_name = "{{site.cnq.deploymentUniqueNameExampleAWS}}"
   ...
   persistent_storage_bucket_names = tolist([
     "{{site.exampleBucketName1}}",
     "{{site.exampleBucketName2}}",
     "{{site.exampleBucketName3}}",
     "{{site.exampleBucketName3}}",
   ])
   qumulo_floating_ips = [
     "{{site.exampleIP42}}",
     "{{site.exampleIP84}}",
     ...
   ]
   ...
   qumulo_primary_ips = [
     "{{site.exampleIP0}}",
     "{{site.exampleIP1}}",
     "{{site.exampleIP2}}",
     "{{site.exampleIP3}}"
   ]
   ...
   qumulo_private_url_node1 = "https://{{site.exampleEndpointIP0}}"
   ```

{% elsif page.deployment == "cfn" %}
1. In the S3 bucket that hosts your deployment files, find the URL to `templates/cnq-standard.template.yaml`. For example:

   ```
   https://my-bucket.s3.us-west-2.amazonaws.com/my-s3-bucket-prefix/templates/cnq-standard.template.yaml
   ```

1. Log in to the [AWS CloudFormation console](https://console.aws.amazon.com/cloudformation/home).

1. On the **Stacks** page, in the upper right, click **Create stack > With new resources (standard)**.

1. On the **Create stack** page, in the **Specify template** section, click **Amazon S3 URL**, enter the URL to `cnq-standard-template.yaml`, and then click **Next**.

1. On the **Specify stack details** page, take the following steps:

   1. <a id="compute-cache-stack-name"></a> In the **Provide a stack name** section, enter a **Stack name**, for example `my-compute-cache-stack`.
   
   1. In the **Parameters** section, under **Cloud Native Qumulo**, take the following steps:

      1. For **S3 bucket name**, enter [the name of the S3 bucket that you used to prepare your files](#prepare-required-files).

      1. For **S3 key prefix**, enter your S3 bucket prefix.

      1. For **S3 bucket region**, enter the same AWS region as the one for your S3 bucket.
  
      1. Select an **EC2 key pair**.

      1. For **Environment type**, select either **Dev** or **Prod**.

   1. Under **AWS network configuration**, take the following steps:

      1. Select a **VPC ID**.
     
      1. Enter **CIDR #1 for the Qumulo security group**.

      1. (Optional) Enter **CIDR #2 for the Qumulo security group**.
   
      1. Select the **Private subnet ID(s)**.

   1. Under **Qumulo file data platform configuration**, take the following steps:

      1. For the **Stack name from the persistent storage CloudFormation deployment**, enter [the name of the stack that you used to create your persistent storage](#persistent-storage-stack-name).

      1. For **Hot or Cold** cluster, select an S3 storage class.

      1. Select the **Qumulo EC2 instance type**.
     
      1. Enter the **Number of Qumulo EC2 instances**.

         This number determines the number of nodes in your Qumulo cluster.

      1. Enter the **Total number of Floating IPs for the Qumulo Cluster**.

         {% include tip.html content="If you intend to scale out your Qumulo cluster, enter 6 floating IP addresses for each EC2 instance." %}

      1. Enter the **Qumulo software version**, **Qumulo cluster name**, and the **Qumulo cluster administrator password**.
  
   1. Click **Next**.

1. On the **Configure stack options** page, read and accept the two acknowledgements, and then click **Next**.

1. On the **Review and create** page, click **Submit**.

   CloudFormation creates resources for the stack and displays the **CREATE_COMPLETE** status for each resource.
{% endif %}

1. To log in to your cluster's Web UI, use the endpoint from the {% if page.deployment == "tf" %}Terraform output{% elsif page.deployment == "cfn" %}the **QumuloPrivateIP** key on the **Outputs** tab for this stack {% endif %} and the username and password that you have configured.

   {% include important.html content="If you change the administrative password for your cluster by using the Qumulo Core Web UI, `qq` CLI, or REST API after deployment, you must add your new password to AWS Secrets Manager." %}

   You can use the Qumulo Core Web UI to create and manage [NFS exports](../nfs/creating-nfs-export.html), [SMB shares](../smb/creating-smb-share.html), [snapshots](../snapshots/managing-snapshots.html), and [continuous replication relationships](../replicating-data/creating-managing-continuous-replication-relationship.html) You can also [join your cluster to Active Directory](https://care.qumulo.com/s/article/Join-your-Qumulo-Cluster-to-Active-Directory), [configure LDAP](../authentication-qumulo-core/configuring-ldap.html), and [perform many other operations](../).

1. Mount your Qumulo file system by using NFS or SMB and your cluster's DNS name or IP address.
