<a id="deploy-persistent-storage"></a>
## Step 1: Deploying Cluster Persistent Storage
This section explains how to deploy the S3 buckets that act as persistent storage for your Qumulo cluster.

{% if page.deployment == "cfn" %}
<a id="prepare-required-files"></a>
### Part 1: Prepare the Required Files
{% endif %}
1. Log in to Nexus and click **Downloads > {{site.cnq.nexusDropDown}}**.

1. On the **AWS** tab and, in the **Download the required files** section, select the Qumulo Core version that you want to deploy and then download the corresponding {% if page.deployment == "cfn" %}CloudFormation template{% elsif page.deployment == "tf" %}Terraform configuration{% endif %}, Debian package, and host configuration file.

1. Create a new S3 bucket and, within your S3 bucket prefix, create the `qumulo-core-install` directory.

1. Within this directory, create another directory with the Qumulo Core version as its name. For example:

   ```
   my-s3-bucket-name/my-s3-bucket-prefix/qumulo-core-install/7.2.3.2
   ```

   {% capture newVer %}{{site.cnq.qCoreVerTip}}{% endcapture %}
   {% include tip.html content=newVer %}

1. {{site.cnq.copyDebAndConfig}}

{% if page.deployment == "cfn" %}
1. Within your S3 bucket's prefix, make a directory called `aws-cloudformation-cnq`.

1. Decompress `aws-cloudformation-cnq-<x.y>.zip` locally and copy it to the `aws-cloudformation-cnq` directory. The following is an example path:

   ```
   my-s3-bucket-name/my-s3-bucket-prefix/aws-cloudformation-cnq
   ```
{% elsif page.deployment == "tf" %}
1. Copy `aws-terraform-cnq-<x.y>.zip` to your Terraform environment and decompress.
{% endif %}

{% if page.deployment == "cfn" %}
1. Find the URL to `templates/persistent-storage.template.yaml`. For example:

   ```
   https://my-bucket.s3.us-west-2.amazonaws.com/my-s3-bucket-prefix/aws-cloudformation-cnq/templates/persistent-storage.template.yaml
   ```

   {% capture newVer %}{{site.cnq.qCoreVerTip}}{% endcapture %}
   {% include tip.html content=newVer %}

<a id="create-cloudformation-stack"></a>
### Part 2: Create the CloudFormation Stack

1. {{site.cnq.logIntoCFN}}

1. On the **Stacks** page, in the upper right, click **Create stack > With new resources (standard)**.

1. On the **Create stack** page, in the **Specify template** section, click **Amazon S3 URL**, enter the URL to `persistent-storage.template.yaml`, and then click **Next**.

1. On the **Specify stack details** page, take the following steps:

   1. <a id="persistent-storage-stack-name"></a> Enter a **Stack name**, for example `my-storage-stack`.

   1. For **S3 bucket name**, enter [the name of the S3 bucket that you used to prepare your files](#prepare-required-files).

   1. For **S3 key prefix**, enter your S3 bucket prefix followed by the `aws-cloudformation-cnq/` directory. For example:

      `my-s3-bucket-prefix/aws-cloudformation-cnq/`

   1. For **S3 bucket region**, enter the same AWS region as the one for your S3 bucket.
  
   1. Click **Next**.

1. On the **Configure stack options** page, read and accept the two acknowledgements, and then click **Next**.

1. On the **Review and create** page, click **Submit**.

   CloudFormation creates resources for the stack and displays the **CREATE_COMPLETE** status for each resource.
{% elsif page.deployment == "tf" %}

1. Navigate to the `persistent-storage` directory and take the following steps:

   1. Run the `terraform init` command.

      Terraform prepares the environment and displays the message `Terraform has been successfully initialized!`

   1. Review the `terraform.tfvars` file.

      * Specify the `deployment_name` and the correct `aws_region` for your cluster's persistent storage.
        
      * Leave the `soft_capacity_limit` at `500`.

   1. Use the `aws` CLI to authenticate to your AWS account.

   1. Run the `terraform apply` command.
  
      {{site.cnq.tfDispExecPlan}}

   1. {{site.cnq.reviewExecPlan}}

      Terraform creates resources according the execution plan and displays:

      * The `Apply complete!` message with a count of added resources
        
      * The names of the created S3 buckets
        
      * Your deployment's unique name
     
      For example:
     
      ```
      Apply complete! Resources: 15 added, 0 changed, 0 destroyed.
      
      Outputs:

      bucket_names = [
        "{{site.exampleBucketName1}}",
        "{{site.exampleBucketName2}}",
        "{{site.exampleBucketName3}}",
        "{{site.exampleBucketName4}}",
      ]
      deployment_unique_name = "{{site.cnq.deploymentUniqueNameExample}}"
      ...
      ```

      {% include tip.html content="You will need the `deployment_unique_name` value to deploy your cluster." %}
{% endif %}
