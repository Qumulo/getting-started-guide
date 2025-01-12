1. Review the **End User Agreement**, click **I agree to the End User Agreement**, and then click **Submit**.

1. Name your cluster.

1. On the **1. Set up cluster** page, select the nodes to add to your cluster.

   As you select nodes, the installer updates the total capacity of your cluster at the bottom of the page.

   {% include note.html content="If any nodes are missing, confirm that they are powered on and connected to the same network." %}

1. Confirm that the individual nodes have the expected capacity.

1. On the **2. Confirm cluster protection level** page, Qumulo Core selects the recommended 2, 3, or 4-drive protection level based on your cluster size and node type.

{% unless page.platform contains 'q2uhg2' %}
1. If the **Customize Protection Level** option appears, you can increase your system resilience by selecting 3- or 4-drive protection.

   {{site.data.alerts.important}}
   <ul>
     <li>
       <p>{{site.adp.before612AddOnly}}</p>
       <p>{{site.adp.before612Description}} {{site.contactQumuloCare}}.</p>
     </li>
     <li>{{site.adp.after612AddReplace}}</li>
     <li>Using 3- or 4-drive protection reduces the total capacity of your cluster.</li>
   </ul>
   {{site.data.alerts.end}}
{% endunless %}

1. Enter a password for the administrative account and click **Create Cluster**.

1. To access the Qumulo Core Web UI, connect to any node by entering its IP address into a browser.
