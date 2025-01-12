You can create and work with S3 buckets {{site.s3.permissions.APIorCLI}}. {{site.s3.permissions.directAPI}}

## Prerequisites
To create and manage S3 buckets {{site.s3.permissions.APIorCLI}}, you need the following [role-based access control (RBAC)](../authorization-qumulo-core/managing-role-based-access-control-rbac.html) privileges:

  * `PRIVILEGE_S3_BUCKETS_WRITE`: Create and delete S3 buckets
  
    {% include note.html content="If you perform create and delete operations on directories by using the `qq` CLI, you also need this privilege." %}

  * `PRIVILEGE_S3_BUCKETS_READ`: List S3 buckets

To create and manage S3 buckets by using the S3 API, you also need:

  * [A valid Qumulo S3 access key](creating-managing-s3-access-keys.html)

  * [A configured AWS CLI](configuring-using-s3-api.html#configuring-aws-cli)


## How S3 Buckets Map to the Qumulo File System
An S3 bucket exposes a portion of your Qumulo file system to applications that use the [Amazon S3 API]({{site.s3.docs.s3}}).

<a id="bucket-root"></a>

The _bucket root directory_ (or _bucket root)_ is the directory to which you attach an S3 bucket. All files under the bucket root directory (and all of its subdirectories) are objects in the bucket. The presence of the slash (`/`) in objects' keys determines the directory hierarchy.

{% include important.html content="Because S3 buckets can use any directory in the file system as a root directory, the same file can be an object in multiple buckets." %}


<a id="object-keys"></a>
### How the Qumulo File System Determines Object Keys
The _object key_ in a Qumulo S3 bucket is its file system path, relative to the bucket's root directory. Only objects that are directories have a trailing slash (`/`) in their keys.

The following example shows the contents of a Qumulo file system.

```
/
├── website-data/
│   └── publish.dat
│
└── application-data/
    ├── develop.dat
    ├── processing/
    └── deployment/
        ├── data1.dat
        └── data2.dat
```

In this example, if you have the S3 bucket `bucket1` with its root directory at `/application-data/deployment/`, the bucket contains objects with the following keys:

* `data1.dat`

* `data2.dat`

However, if you have the S3 bucket `bucket2` with its root directory at `/application-data/`, the bucket contains objects with the following keys:

* `develop.dat`

* `processing/`

* `deployment/data1.dat`

* `deployment/data2.dat`

{{site.data.alerts.note}}
<p>In this example:</p>
<ul>
  <li>Both buckets contain <code>/application-data/deployment/data1.dat</code> and <code>/application-data/deployment/data2.dat</code> as objects.</li>
  <li>The <code>processing/</code> object in <code>bucket2</code> has a trailing slash because it is a directory.</li>
</ul>
{{site.data.alerts.end}}

<a id="bucket-naming-rules"></a>
### How to Name an S3 Bucket
When you create an S3 bucket, you name it. A bucket's name doesn't need to be related to its root directory.

Except for names that contain the period (`.`), Qumulo Core accepts all names that conform to the following Amazon S3 bucket naming rules.

* Bucket names must be between 3 and 63 characters long.

* Bucket names can consist only of lowercase ASCII letters, numbers, and hyphens (`-`).

* Bucket names must start with a letter or a number.

### How to Choose a Bucket Root
You specify the [bucket root directory](#bucket-root) depending on how you create your S3 bucket.

* When you create an S3 bucket {{site.s3.permissions.APIorCLI}}, you can choose a directory to use as the bucket root.

* When you create an S3 bucket by using the `CreateBucket` S3 API action, the API creates a new directory with the same name as the bucket under the default bucket directory prefix. For more information, see [Configuring the Default Bucket Directory Prefix for S3 Buckets](#default-directory-prefix). 

* If you don't specify a directory, the Qumulo REST API and `qq` CLI use the {{page.varDefaultPrefix}}.

The user that creates a new directory for a new bucket owns the directory. For more information, see [Managing Access to S3 Buckets in a Qumulo Cluster](managing-access-to-s3-buckets.html).


## Creating S3 Buckets
You can create an S3 bucket {{site.s3.permissions.APIorCLI}}. {{site.s3.permissions.directAPI}}

While the Qumulo REST API and `qq` CLI let you use an existing directory as the new bucket root, the S3 API always creates a new directory for the bucket root.

{{site.data.alerts.important}}
<ul>
  <li>All S3 buckets in a Qumulo cluster share the same namespace: It isn't possible to create two buckets with the same name, even if they use different directories as their bucket root.</li>
  <li>All S3 buckets must follow the <a href="#bucket-naming-rules">bucket naming rules</a>.</li>
</ul>
{{site.data.alerts.end}}


<a id="default-directory-prefix"></a>
### Configuring the Default Bucket Directory Prefix for S3 Buckets
The _default bucket directory prefix_ is the directory under which Qumulo Core creates new bucket root directories when it creates S3 buckets by using the `CreateBucket` S3 API action or when you create an S3 bucket without specifying a directory {{site.s3.permissions.APIorCLI}}.

By default, the default bucket directory prefix for newly created buckets is the cluster's root directory (`/`). Thus, if you create a bucket named `my-bucket`, its root directory is `/my-bucket`.

* To view the current default bucket directory prefix {{site.s3.permissions.APIorCLI}}, you need the {{site.s3.permissions.bucketsRead}}.

* To change the default bucket directory prefix, you need the {{site.s3.permissions.bucketsWrite}}.

* To enable or suspend S3 bucket versioning, use the {% include qq.html command="s3_modify_bucket" %} command.

#### To Configure the Default Bucket Directory Prefix by Using the qq CLI
1. To view the current default bucket directory prefix, run the {% include qq.html command="s3_get_settings" %} command.

   {{site.exampleOutput}}

   ```json 
   {"enabled": true, "base_path": "/buckets/", ...}
   ```

1. To change the setting, run the {% include qq.html command="s3_modify_settings" %} command and specify the new default bucket directory prefix. In the following example, we specify `/buckets`.

   ```bash
   $ qq s3_modify_settings \
     --base-path /buckets
   ```

### Creating an S3 Bucket by Using the qq CLI
To create an S3 bucket {{site.s3.permissions.APIorCLI}}, you need the {{site.s3.permissions.bucketsWrite}}.

{% include important.html content="In Qumulo Core 6.0.1.1 (and higher), the `qq` CLI command changed from `s3_create_bucket` to `s3_add_bucket` and the flag for specifying the directory path has changed from `--path` to `--fs-path`." %}

When you use the `qq` CLI to create a bucket, you can use a new or existing directory as the bucket root.

{% include note.html content="If an entry with the specified name or directory already exists, or if you don't have permission to create a directory, the command returns an error. For more information, see [Configuring the Default Bucket Directory Prefix for S3 Buckets](#default-directory-prefix)." %}

* To create a new, empty bucket from the {{page.varDefaultPrefix}}, run the {% include qq.html command="s3_add_bucket" %} command and specify the bucket name. For example:

  ```bash
  $ qq s3_add_bucket \
    --name my-bucket
  ```

  Qumulo Core creates a new directory named `my-bucket` under the default bucket directory prefix.

* To create a bucket from an existing directory, run the {% include qq.html command="s3_add_bucket" %} command and specify the bucket name and the directory path. For example:

  ```bash
  $ qq s3_add_bucket \
    --name my-bucket \
    --fs-path /products/web/appliances/
  ```
  
* To create a bucket for a path that doesn't exist yet, specify the name and path and add the `--create-fs-path` flag. For example:

  ```bash
  $ qq s3_add_bucket \
    --name my-bucket \
    --fs-path /products/web/appliances/ \
    --create-fs-path
  ```

### Creating an S3 Bucket by Using the S3 API
Run the `aws s3api create-bucket` command and specify the bucket name. This command uses the [`CreateBucket`]({{site.s3.actions.CreateBucket}}) S3 API action. For example:

```bash
$ aws s3api create-bucket \
  --bucket my-bucket
```

Qumulo Core creates the bucket root directory under the {{page.varDefaultPrefix}} and names it the same as the bucket. In this example, if the default bucket directory prefix is `/buckets/`, the new bucket root directory is `/buckets/my-bucket/`.

{% include note.html content="When you use the `CreateBucket` S3 API action with the `LocationConstraint` parameter, the Qumulo S3 API supports only the `local` region." %}


## Configuring S3 Buckets
You can view and modify the settings for individual buckets {{site.s3.permissions.APIorCLI}}.

You can configure global settings, such as the {{page.varDefaultPrefix}} for all S3 buckets. For more information about configuring anonymous access for individual S3 buckets, see, see [Enabling Anonymous Access for an S3 Bucket](managing-access-to-s3-buckets.html#enabling-anonymous-access).

* To view the current bucket configuration {{site.s3.permissions.APIorCLI}}, you need the {{site.s3.permissions.bucketsRead}}. For more information, see {% include qq.html command="s3_get_bucket" %} in the {{site.guides.cli}}.

* To change the bucket configuration, you need the {{site.s3.permissions.bucketsWrite}}. For more information, see {% include qq.html command="s3_modify_bucket" %} in the {{site.guides.cli}}.


<a id="enable-object-lock"></a>
## Enabling Object Lock for S3 Buckets
An [Object Lock](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lock.html) can prevent an S3 object from being deleted for a limited time or indefinitely. For information about file locks in Qumulo Core, see [Managing File Locks](../authorization-qumulo-core/managing-file-locks.html).

### To Enable Object Lock for an S3 Bucket by Using the qq CLI
1. Use an account with the `S3_BUCKETS_WRITE` [role-based access control (RBAC) role](../authorization-qumulo-core/managing-role-based-access-control-rbac.html).

1. Run the {% include qq.html command="s3_modify_bucket" %} command, specify the bucket name, and use the `--enable-object-locking` flag. For example:

```bash
$ qq s3_modify_bucket \
  --name my-bucket \
  --enable-object-locking
```

### To Enable Object Lock for an S3 Bucket by Using the S3 API
{% capture noDefRet %}{{site.s3.objectLocknoDefaultRetention}}{% endcapture %}
{% include note.html content="Currently, because Qumulo Core doesn't support default retention periods, you can set only a [compliance retention period](https://docs.aws.amazon.com/AmazonS3/latest/userguide/batch-ops-retention-date.html) on an individual object in an S3 bucket by using the [`PutObjectRetention`](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObjectRetention.html) API action." %}

1. To enable versioning for your S3 bucket, use the [`PutBucketVersioning`](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketVersioning.html) API action.

1. To enable Object Lock for your S3 bucket, use the [`PutObjectLockConfiguration`](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObjectLockConfiguration.html) API action.


## Listing S3 Buckets
You can list all S3 buckets in your Qumulo cluster {{site.s3.permissions.APIorCLI}}. {{site.s3.permissions.directAPI}}

### To List S3 Buckets by Using the qq CLI
To list your S3 buckets {{site.s3.permissions.APIorCLI}}, you need the {{site.s3.permissions.bucketsRead}}.

* Run the {% include qq.html command="s3_list_buckets" %} command.

  {{site.exampleOutput}} {{site.s3.permissions.timesUTC}}

  ```
  name       creation_time                   path        versioning
  =========  ==============================  ==========  ===========
  my-bucket  2022-12-13T22:18:01.406433425Z  /my-bucket  Unversioned
  ```

* For JSON output, use the `--json` flag.

  {{site.exampleOutput}} {{site.s3.permissions.timesUTC}} {{page.varListJSON}}

  ```json
  {
    "buckets": [
      {
        "creation_time": "2022-12-13T22:18:01.406433425Z",
        "name": "my-bucket",
        "path": "/my-bucket",
        "versioning": "Unversioned"
      }
    ]
  }
  ```

### To List S3 Buckets by Using the S3 API
Run the `aws s3api list-buckets` command. This command uses the [`ListBuckets`]({{site.s3.actions.ListBuckets}}) S3 API action.

{{site.exampleOutput}} {{site.s3.permissions.timesUTC}} {{page.varListJSON}}

```json
{
  "Buckets": [
    {
      "Name": "my-bucket",
      "CreationDate": "2022-12-13T22:18:01.406Z"
    }
  ]
}
```

## Deleting S3 Buckets
You can delete an S3 bucket {{site.s3.permissions.APIorCLI}}. {{site.s3.permissions.directAPI}}

While the Qumulo REST API and `qq` CLI let you choose whether to also delete the bucket root directory, the S3 API always deletes the bucket root directory.

{% capture deleteNote %}Before you delete your S3 bucket, you must either let all in-progress upload operations for the bucket ({{page.varUploadKinds}}) complete or you must abort the operations.{% endcapture %}
{% include note.html content=deleteNote %}

### Deleting an S3 Bucket by Using the qq CLI
{% capture varMpuInProgress %}The bucket has in-progress upload operations ({{page.varUploadKinds}}).{% endcapture %}

To delete an S3 bucket {{site.s3.permissions.APIorCLI}}, you need the {{site.s3.permissions.bucketsWrite}}.

When you use the `qq` CLI to delete a bucket, you can choose to also delete the bucket root directory.

* To delete an S3 bucket, but not its root directory, run the {% include qq.html command="s3_delete_bucket" %} command and specify the bucket name. For example:

  ```bash
  $ qq s3_delete_bucket \
    --name my-bucket
  ```

  This command doesn't delete the bucket root directory. It deletes all metadata related to the bucket from your Qumulo cluster.
  
  If any of the following conditions are true, the command returns an error:

  * {{page.varNoBucket}}
  
  * You don't have the {{site.s3.permissions.bucketsWrite}}.
  
  * {{varMpuInProgress}}

* To delete a bucket together with its root directory, use the {% include qq.html command="s3_delete_bucket" %} command, specify the bucket name, and use the `--delete-root-dir` flag. For example:

  ```bash
  $ qq s3_delete_bucket \
    --delete-root-dir \
    --name my-bucket
  ```
  
  If any of the following conditions are true, the command returns an error:
  
  * {{page.varCantDelRootDir}}

  * {{page.varRootDirNotEmpty}}
  
### Deleting an S3 Bucket by Using the S3 API
Run the `aws s3api delete-bucket` command and specify the bucket name. This command uses the [`DeleteBucket`]({{site.s3.actions.DeleteBucket}}) S3 API action. For example:

```bash
$ aws s3api delete-bucket \
  --bucket my-bucket
```

This command deletes the bucket root directory and all metadata related to the bucket from your Qumulo cluster.

If any of the following conditions are true, the command returns an error:

* {{page.varNoBucket}}

* {{page.varCantDelRootDir}}

* {{page.varRootDirNotEmpty}}

* {{varMpuInProgress}}
