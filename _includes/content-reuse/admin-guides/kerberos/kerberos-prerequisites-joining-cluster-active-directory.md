To join your cluster to Active Directory, log in to the Qumulo Core Web UI and click **Cluster > Active Directory**.

## Using Active Directory (AD) for POSIX Attributes (RFC 2307)
While [using AD for POSIX attributes](https://docs.qumulo.com/administrator-guide/authorization-qumulo-core/using-active-directory-for-posix-attributes.html) is optional, it helps avoid issues with Linux ID mapping. We recommend enabling {% include rfc.html rfc='2307' %} to match your client's functionality.

* Enabling RFC 2307 might simplify `AUTH_SYS`-based Linux clients that access the cluster by using known UIDs and GIDs. In this way, the cluster can map the UIDs and GIDs to the user or group objects on the AD server and enforce the appropriate permissions.

* If you configure `sssd` on Kerberos-mounted Linux clients for mapping by SID, disabling RFC 2307 can help avoid ascribing special meaning to randomly assigned Linux UIDs and GIDs.


## Specifying the Base Distinguished Name (Base DN)
Qumulo uses LDAP to query the AD domain for users and groups. For this functionality, a Base DN must cover any identities intended for use with Kerberos. For example, if multiple organizational units (OUs) contain users, you must include them all in the Base DN (separated with semicolons).

Alternatively, a parent container can hold all nested containers of interest. It is possible to set a top-level domain (TLD) as the Base DN (however, this can cause queries to perform poorly in certain scenarios). We recommend using as specific a Base DN as possible. If you don't configure the Base DN correctly, Linux clients might present permissions such as `nobody` or `65534`.

In the following example, there is an OU with the AD domain `my.example.com`. The TLD Base DN for this domain is as follows.

```
DC=my,DC=example,DC=com
```

If a `Users` container holds users and a `Computers` container holds machine accounts, you can set the Base DN as follows.

```
CN=Users,DC=my,DC=example,DC=com;CN=Computers,DC=stuff,DC=example,DC=com
```

{% include note.html content="This example is a very common configuration for user and computer objects in AD." %}


## Using the Active Directory Domain Controller as the NTP Server
{% include content-reuse/admin-guides/kerberos/kerberos-ntp-server.md %}
