The Qumulo OpenMetrics API has a single endpoint that provides a complete view of point-in-time telemetry from Qumulo Core to monitoring systems. These systems, such as [Prometheus](https://github.com/prometheus/prometheus), can consume the OpenMetrics data format that the Qumulo REST API emits without custom code or a monitoring agent. For more information about data formats, see your monitoring system's documentation.


## Accessing Qumulo Metrics
Qumulo metrics are available at the following endpoint.

```
https://<my-cluster-hostname>:8000/v2/metrics/endpoints/default/data
```

You can configure a monitoring system that supports the [OpenMetrics Specification](https://github.com/OpenObservability/OpenMetrics/blob/main/specification/OpenMetrics.md) to use [bearer token authentication](../connecting-to-external-services/creating-using-access-tokens-to-authenticate-external-services-qumulo-core.html) to access this endpoint.

## Metric Types
All Qumulo metrics belong to one of the following OpenMetrics types.

<table>
  <thead>
    <tr>
      <th class="width-15">Metric Type</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a id="metric-type-counter"></a><code>counter</code></td>
      <td>An integer that increases monotonically from zero, stored in <code>&lt;metric_name&gt;_count</code>. {% include note.html content="During normal operation, the value of <code>counter</code> never decreases." %}</td>
    </tr>
    <tr>
      <td><a id="metric-type-gauge"></a><code>gauge</code></td>
      <td>A value that represents a single integer (similar to <code>counter</code>), stored in <code>&lt;metric_name&gt;</code>. {% include note.html content="During normal operation, the value of a <code>gauge</code> metric might increase or decrease." %}</td>
    </tr>
    <tr>
      <td><a id="metric-type-histogram"></a><code>histogram</code></td>
      <td><p>A representation of a series of <em>buckets</em>, where each bucket tracks values within a specific range.</p><p>A histogram has a <code>count</code> field and a <code>sum</code> field, stored in <code>&lt;metric_name&gt;_count</code> (the total number of samples) and <code>&lt;metric_name&gt;_sum</code> (the sum of all samples). Qumulo Core emits a single bucket that contains all samples.</p> {% include tip.html content="You can use <code>histogram</code> metrics to keep track of averages by dividing the <code>sum</code> field by the <code>count</code> field." %}</td>
    </tr>
    <tr>
      <td><a id="metric-type-info"></a><code>info</code></td>
      <td>Informational text about the system, stored in <code>&lt;metric_name&gt;_info</code>. An <code>info</code> metric always has a value of <code>1</code> and labels that contain detailed information.</td>
    </tr>
  </tbody>
</table>

For more information, see [Metric Types](https://github.com/OpenObservability/OpenMetrics/blob/main/specification/OpenMetrics.md#metric-types) in the OpenMetrics Specification.


## Metric Labels
The OpenMetrics format allows for metric labeling for communicating additional information. To provide context for metrics, Qumulo Core emits metric-specific labels. For example, the `name` of a protocol operation or the `url` of a remote server. For more information, see [Available Labels](#available-labels).


## Available Metrics
The following table lists metric names, types, labels, and descriptions.

{% include note.html content="For Qumulo as a Service, all metrics with a `node_id` label are unavailable because they refer to specific hardware." %}

<table class="pdf-reduce">
  <thead>
    <tr>
      <th class="width-30">Metric Name</th>
      <th class="width-13">Metric Type</th>
      <th>Labels</th>
      <th class="width-10">Suppor&shy;ted from Qumulo Core Version</th>
      <th class="width-20">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>qumulo</code></td>
      <td><a href="#metric-type-info"><code>info</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><code>max_drive_failures</code></li>
          <li class="pdf-friendly"><code>max_node_failures</code></li>
          <li class="pdf-friendly"><code>name</code></li>
          <li class="pdf-friendly"><code>platform</code></li>
          <li class="pdf-friendly"><code>service_model</code></li>
          <li class="pdf-friendly"><code>uuid</code></li>
          <li class="pdf-friendly">
            <code>version</code>
            {% include tip.html content="Don't confuse this label for the <em>Qumulo Core version</em> with the identically named label for the <em>kernel version</em> for the <code>qumulo_kernel</code> metric." %} 
          </li>
        </ul>
      </td>
      <td>5.3.0</td>
      <td>Qumulo Core information, including the cluster name, cluster UUID, and the current Qumulo Core version.</td>
    </tr>
{% if page.platform == 'on-prem' %}
    <tr>
      <td><code>qumulo_kernel</code></td>
      <td><a href="#metric-type-info"><code>info</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><code>cmdline</code></li>
          <li class="pdf-friendly"><code>node_id</code></li>          
          <li class="pdf-friendly">
            <code>version</code>
            {% include tip.html content="Don't confuse this label for the <em>kernel version</em> with the identically named label for the <em>Qumulo Core version</em> for the <code>qumulo</code> metric." %}
          </li>
        </ul>
      </td>
      <td>7.2.0.2</td>
      <td>
        Kernel information for each node in a cluster, including the command-line arguments that were used for starting the kernel, the node ID, and the kernel version.
        {% include note.html content="The <code>qumulo_kernel</code> metric is available only on nodes configured by using the <a href='../getting-started/installing-product-package.html'>Qumulo Core Product Package</a>." %} 
      </td>
    </tr>
{% endif %}
    <tr>
      <td><code>qumulo_node</code></td>
      <td><a href="#metric-type-info"><code>info</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-node_id"><code>node_id</code></a></li>
          <li class="pdf-friendly"><code>node_model</code></li>
        </ul>
      </td>
      <td>6.0.2</td>
      <td>Information about the nodes in the cluster, including the node ID and the node model</td>
    </tr>
    <tr>
      <td><code>qumulo_ad_netlogon_request<br>_errors</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-domain_url"><code>domain_url</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-server_url"><code>server_url</code></a></li>
        </ul>
      </td>
      <td>5.3.0</td>
      <td>The total number of Active Directory (AD) <code>NETLOGON</code> requests that resulted in an error</td>
    </tr>
    <tr>
      <td><code>qumulo_ad_netlogon_request<br>_latency_seconds</code></td>
      <td><a href="#metric-type-histogram"><code>histogram</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-domain_url"><code>domain_url</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-server_url"><code>server_url</code></a></li>
        </ul>
      </td>
      <td>5.3.0</td>
      <td>The total latency for AD <code>NETLOGON</code> requests</td>
    </tr>
    <tr>
      <td><code>qumulo_ad_netlogon_requests</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-domain_url"><code>domain_url</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-server_url"><code>server_url</code></a></li>
        </ul>
      </td>
      <td>5.3.0</td>
      <td>The total number of completed AD <code>NETLOGON</code> operations</td>
    </tr>
    <tr>
      <td><code>qumulo_cpu_crit_temperature_celsius</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-cpu"><code>cpu</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>7.2.0.2</td>
      <td>The critical temperature threshold for each physical CPU</td>
    </tr>
    <tr>
      <td><code>qumulo_cpu_max_temperature<br>_celsius</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-cpu"><code>cpu</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>5.3.1</td>
      <td>The maximum temperature threshold for each physical CPU</td>
    </tr>
    <tr>
      <td><code>qumulo_cpu_temperature<br>_celsius</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-cpu"><code>cpu</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>5.3.0</td>
      <td>The temperature for each physical CPU, in degrees Celsius</td>
    </tr>    
    <tr>
      <td><code>qumulo_disk_endurance<br>_percent</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-disk_type"><code>disk_type</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-drive_bay"><code>drive_bay</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>5.3.1</td>
      <td>The remaining disk endurance value for each disk in the cluster, ranging <code>100</code> (no disk wear) to <code>0</code> (disk is worn fully)</td>
    </tr>
    <tr>
      <td><code>qumulo_disk_transport<br>_errors</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-disk_type"><code>disk_type</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-drive_bay"><code>drive_bay</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>5.3.2</td>
      <td>The total number of communication errors between the specified drive and its host.</td>
    </tr>
    <tr>
      <td><code>qumulo_disk_uncorrectable<br>_media_errors</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-disk_type"><code>disk_type</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-drive_bay"><code>drive_bay</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>5.3.2</td>
      <td>The total number of uncorrectable errors on the specified drive's physical media.</td>
    </tr>
    <tr>
      <td><code>qumulo_disk_is_unhealthy</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-disk_type"><code>disk_type</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-drive_bay"><code>drive_bay</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>5.3.0</td>
      <td>The health of each disk in the cluster, ranging from <code>0</code> (the disk is healthy) to <code>1</code> (the disk is unhealthy)</td>
    </tr>
    <tr>
      <td><code>qumulo_disk_operation<br>_latency_seconds</code></td>
      <td><a href="#metric-type-histogram"><code>histogram</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-disk_type"><code>disk_type</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-drive_bay"><code>drive_bay</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-io_type"><code>io_type</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>5.3.0</td>
      <td>The total latency for disk I/O operations</td>
    </tr>
    <tr>
      <td><code>qumulo_fan_speed_rpm</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-fan"><code>fan</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>5.3.0</td>
      <td>The fan speed, in RPM</td>
    </tr>
    <tr>
      <td><code>qumulo_fs_capacity_bytes</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td>&mdash;</td>
      <td>5.3.0</td>
      <td>The total cluster space, in bytes</td>
    </tr>
    <tr>
      <td><code>qumulo_fs_directory<br>_tree_entries</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-entry_type"><code>entry_type</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-path"><code>path</code></a></li>
        </ul>
      </td>
      <td>5.3.0</td>
      <td>The number of file system objects on the cluster, sorted by object type</td>
    </tr>
    <tr>
      <td><code>qumulo_fs_directory<br>_used_bytes</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-path"><code>path</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-usage_type"><code>usage_type</code></a></li>
        </ul>
      </td>
      <td>5.3.0</td>
      <td>The amount of space that object types use, in bytes</td>
    </tr>
    <tr>
      <td><code>qumulo_fs_free_bytes</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td>&mdash;</td>
      <td>5.3.0</td>
      <td>The free space on the cluster, in bytes</td>
    </tr>
    <tr>
      <td><code>qumulo_fs_snapshots</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td>&mdash;</td>
      <td>5.3.0</td>
      <td>The number of snapshots on the cluster</td>
    </tr>
    <tr>
      <td><code>qumulo_ldap_lookup<br>_request_errors</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-domain_url"><code>domain_url</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-server_url"><code>server_url</code></a></li>
        </ul>
      </td>
      <td>5.3.0</td>
      <td>The total number of LDAP requests that resulted in an error</td>
    </tr>
    <tr>
      <td><code>qumulo_ldap_lookup<br>_request_latency_seconds</code></td>
      <td><a href="#metric-type-histogram"><code>histogram</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-domain_url"><code>domain_url</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-server_url"><code>server_url</code></a></li>
        </ul>
      </td>
      <td>5.3.0</td>
      <td>The total latency of LDAP requests</td>
    </tr>
    <tr>
      <td><code>qumulo_ldap_lookup<br>_requests</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-domain_url"><code>domain_url</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-server_url"><code>server_url</code></a></li>
        </ul>
      </td>
      <td>5.3.0</td>
      <td>The total number of completed LDAP requests</td>
    </tr>
    <tr>
      <td><code>qumulo_ldap_operation<br>_errors</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td><a href="#metric-label-domain_url"><code>domain_url</code></a></td>
      <td>5.3.0</td>
      <td>The total number of LDAP operations that resulted in an error</td>
    </tr>
    <tr>
      <td><code>qumulo_ldap_operation<br>_latency_seconds</code></td>
      <td><a href="#metric-type-histogram"><code>histogram</code></a></td>
      <td><a href="#metric-label-domain_url"><code>domain_url</code></a></td>
      <td>5.3.0</td>
      <td>The total latency for LDAP operations</td>
    </tr>
    <tr>
      <td><code>qumulo_ldap_operations</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td><a href="#metric-label-domain_url"><code>domain_url</code></a></td>
      <td>5.3.0</td>
      <td>The total number of completed LDAP operations</td>
    </tr>
    <tr>
      <td><code>qumulo_memory_correctable<br>_ecc_errors</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td><a href="#metric-label-node_id"><code>node_id</code></a></td>
      <td>5.3.0</td>
      <td>The total number of memory errors that Qumulo Core corrected automatically</td>
    </tr>
    <tr>
      <td><code>qumulo_network_interface<br>_is_down</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-bond"><code>bond</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-interface"><code>interface</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-role"><code>role</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>5.3.0</td>
      <td>The interface status, <code>0</code> (interface is up) or <code>1</code> (interface is down)</td>
    </tr>
    <tr>
      <td><code>qumulo_network_interface<br>_link_speed_bits_per_second</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-bond"><code>bond</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-interface"><code>interface</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-role"><code>role</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>5.3.0</td>
      <td>The negotiated link speed for the specified interface</td>
    </tr>
    <tr>
      <td><code>qumulo_network_interface<br>_receive_errors</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-bond"><code>bond</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-interface"><code>interface</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-role"><code>role</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>5.3.0</td>
      <td>The total number of receive errors on the specified interface</td>
    </tr>
    <tr>
      <td><code>qumulo_network_interface<br>_received_bytes</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-bond"><code>bond</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-interface"><code>interface</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-role"><code>role</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>5.3.0</td>
      <td>The total bytes received on the specified interface</td>
    </tr>
    <tr>
      <td><code>qumulo_network_interface<br>_received_packets</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-bond"><code>bond</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-interface"><code>interface</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-role"><code>role</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>5.3.0</td>
      <td>The total number of packets received on the specified interface</td>
    </tr>
    <tr>
      <td><code>qumulo_network_interface<br>_transmit_errors</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-bond"><code>bond</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-interface"><code>interface</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-role"><code>role</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>5.3.0</td>
      <td>The total number of transmission errors on the specified interface</td>
    </tr>
    <tr>
      <td><code>qumulo_network_interface<br>_transmitted_bytes</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-bond"><code>bond</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-interface"><code>interface</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-role"><code>role</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>5.3.0</td>
      <td>The total number of bytes transmitted on the specified interface</td>
    </tr>
    <tr>
      <td><code>qumulo_network_interface<br>_transmitted_packets</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-bond"><code>bond</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-interface"><code>interface</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-role"><code>role</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>5.3.0</td>
      <td>The total number of packets transmitted on the specified interface</td>
    </tr>
    <tr>
      <td><code>qumulo_power_supply<br>_is_unhealthy</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-location"><code>location</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>5.3.0</td>
      <td>PSU health, <code>0</code> (healthy) or <code>1</code> (unplugged, removed, or unresponsive)</td>
    </tr>
    <tr>
      <td><code>qumulo_protocol_client<br>_connections</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td><a href="#metric-label-protocol"><code>protocol</code></a></td>
      <td>5.3.0</td>
      <td>The total number of clients that have connected to the specified protocol</td>
    </tr>
    <tr>
      <td><code>qumulo_protocol_client<br>_disconnections</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td><a href="#metric-label-protocol"><code>protocol</code></a></td>
      <td>5.3.0</td>
      <td>The total number of clients that have disconnected from the specified protocol</td>
    </tr>
    <tr>
      <td><code>qumulo_protocol_operation<br>_bytes</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-data_type"><code>data_type</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-io_type"><code>io_type</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-op_name"><code>op_name</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-protocol"><code>protocol</code></a></li>
        </ul>
      </td>
      <td>5.3.0</td>
      <td>The total bytes that protocol operations have transferred</td>
    </tr>
    <tr>
      <td><code>qumulo_protocol_operation<br>_latency_seconds</code></td>
      <td><a href="#metric-type-histogram"><code>histogram</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-data_type"><code>data_type</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-io_type"><code>io_type</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-op_name"><code>op_name</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-protocol"><code>protocol</code></a></li>
        </ul>
      </td>
      <td>5.3.0</td>
      <td>The total latency for protocol operations</td>
    </tr>
    <tr>
      <td><code>qumulo_protocol_operations</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li class="pdf-friendly"><a href="#metric-label-data_type"><code>data_type</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-io_type"><code>io_type</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-op_name"><code>op_name</code></a></li>
          <li class="pdf-friendly"><a href="#metric-label-protocol"><code>protocol</code></a></li>
        </ul>
      </td>
      <td>5.3.0</td>
      <td>The total number of completed protocol operations</td>
    </tr>
    <tr>
      <td><code>qumulo_quorum_node_is<br>_offline</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td><a href="#metric-label-node_id"><code>node_id</code></a></td>
      <td>5.3.0</td>
      <td>The online status for each node in the cluster, <code>0</code> (node online) or <code>1</code> (node offline)</td>
    </tr>
    <tr>
      <td><code>qumulo_time_is_not_synchronizing</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td><a href="#metric-label-node_id"><code>node_id</code></a></td>
      <td>5.3.0</td>
      <td>The time synchronization status for each node in the cluster, <code>0</code> (time is synchronized) or <code>1</code> (time isn't synchronized)</td>
    </tr>
  </tbody>
</table>


## Available Labels
The following table lists metric label names, possible values, and descriptions.

<table>
  <thead>
    <tr>
      <th>Label Name</th>
      <th>Possible Values</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a id="metric-label-bond"></a><code>bond</code></td>
      <td>
        <ul>
          <li class="pdf-friendly"><code>bond0</code></li>
          <li class="pdf-friendly"><code>bond1</code></li>
        </ul>
      </td>
      <td>The bond to which a network interface belongs</td>
    </tr>
    <tr>
      <td><a id="metric-label-cpu"></a><code>cpu</code></td>
      <td>A non-negative integer</td>
      <td>The CPU index in the node</td>
    </tr>
    <tr>
      <td><a id="metric-label-data_type"></a><code>data_type</code></td>
      <td>
        <ul>
          <li class="pdf-friendly"><code>data</code>: Read or write operations on the data of a file.</li>
          <li class="pdf-friendly"><code>metadata</code>: Operations (such as <code>lookup</code>, <code>stat</code>, or <code>getattr</code>) unrelated to a file's data</li>
          <li class="pdf-friendly"><code>none</code>: Operations that operate on neither the file data nor the metadata. {% include note.html content="The protocol often requires these operations for session negotiation and authentication." %}</li>
        </ul>
      </td>
      <td>The data type that an operation transfers</td>
    </tr>
    <tr>
      <td><a id="metric-label-disk_type"></a><code>disk_type</code></td>
      <td>
        <ul>
          <li class="pdf-friendly"><code>hdd</code>: Hard Disk Drive</li>
          <li class="pdf-friendly"><code>ssd</code>: Solid-State Drive</li>
        </ul>
      </td>
      <td>The underlying storage type</td>
    </tr>
    <tr>
      <td><a id="metric-label-domain_url"></a><code>domain_url</code></td>
      <td>An Active Directory domain (for example, <code>my-domain.com</code>) or an LDAP bind URI (for example, <code>ldap://my-server.my-domain.com</code>)</td>
      <td>The URL of the domain</td>
    </tr>
    <tr>
      <td><a id="metric-label-drive_bay"></a><code>drive_bay</code></td>
      <td>A drive bay name. For example: <code>b3</code>, <code>1.1</code></td>
      <td>The physical drive bay in the chassis.</td>
    </tr>
    <tr>
      <td><a id="metric-label-entry_type"></a><code>entry_type</code></td>
      <td>
        <ul>
          <li class="pdf-friendly"><code>alternate_data_stream</code></li>
          <li class="pdf-friendly"><code>directory</code></li>
          <li class="pdf-friendly"><code>file</code></li>
          <li class="pdf-friendly"><code>other</code></li>
          <li class="pdf-friendly"><code>symlink</code></li>
        </ul>
      </td>
      <td>The file system object type</td>
    </tr>
    <tr>
      <td><a id="metric-label-fan"></a><code>fan</code></td>
      <td>A fan name, for example <code>system fan 1</code></td>
      <td>The fan name</td>
    </tr>
    <tr>
      <td><a id="metric-label-interface"></a><code>interface</code></td>
      <td>An interface name, for example <code>eth0</code></td>
      <td>The interface name</td>
    </tr>
    <tr>
      <td><a id="metric-label-io_type"></a><code>io_type</code></td>
      <td>
        <ul>
          <li class="pdf-friendly"><code>composite</code></li>
          <li class="pdf-friendly"><code>none</code></li>
          <li class="pdf-friendly"><code>read</code></li>
          <li class="pdf-friendly"><code>wait</code>: A blocking operation that takes an indeterminate amount of time</li>
          <li class="pdf-friendly"><code>write</code></li>
        </ul>
      </td>
      <td>The I/O that an operation performs</td>
    </tr>
    <tr>
      <td><a id="metric-label-location"></a><code>location</code></td>
      <td>A location on the chassis, for example <code>left</code> or <code>right</code></td>
      <td>The location on the chassis. {% include note.html content="For PSU, this location is relative to the back of the node." %}</td>
    </tr>
    <tr>
      <td><a id="metric-label-node_id"></a><code>node_id</code></td>
      <td>A positive integer that represents a node ID in the cluster.</td>
      <td>A value that differentiates between the different nodes in a cluster</td>
    </tr>
    <tr>
      <td><a id="metric-label-op_name"></a><code>op_name</code></td>
      <td>Any operation name, including NFSv3, NFSv4.1, SMBv2, SMBv3, REST, S3, replication, or FTP</td>
      <td>The recorded operation</td>
    </tr>
    <tr>
      <td><a id="metric-label-path"></a><code>path</code></td>
      <td>Slash (<code>/</code>)</td>
      <td>The path to a directory in the file system</td>
    </tr>
    <tr>
      <td><a id="metric-label-protocol"></a><code>protocol</code></td>
      <td>
        <ul>
          <li class="pdf-friendly"><code>nfs</code>: NFSv3 or NFSv4.1</li>
          <li class="pdf-friendly"><code>smb</code>: SMBv2 or SMBv3</li>
          <li class="pdf-friendly"><code>rest</code></li>
          <li class="pdf-friendly"><code>s3</code></li>
          <li class="pdf-friendly"><code>replication</code></li>
          <li class="pdf-friendly"><code>ftp</code></li>
        </ul>
      </td>
      <td>The protocol of the recorded operation</td>
    </tr>
    <tr>
      <td><a id="metric-label-role"></a><code>role</code></td>
      <td>
        <ul>
          <li class="pdf-friendly"><code>frontend</code></li>
          <li class="pdf-friendly"><code>backend</code></li>
        </ul>
      </td>
      <td>The role of the interface {% include note.html content="<code>frontend</code> includes protocol, management, and replication traffic. <code>backend</code> includes all intra-node communications." %}</td>
    </tr>
    <tr>
      <td><a id="metric-label-server_url"></a><code>server_url</code></td>
      <td>A hostname (for example, <code>ad.my-domain.com</code>) or an IP address</td>
      <td>The URL of a remote server</td>
    </tr>
    <tr>
      <td><a id="metric-label-usage_type"></a><code>usage_type</code></td>
      <td>
        <ul>
          <li class="pdf-friendly"><code>data</code></li>
          <li class="pdf-friendly"><code>metadata</code></li>
          <li class="pdf-friendly"><code>snapshot</code></li>
        </ul>
      </td>
      <td>The data type that uses space</td>
    </tr>          
  </tbody>
</table>
