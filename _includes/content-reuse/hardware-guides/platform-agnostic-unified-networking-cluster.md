{% include content-reuse/hardware-guides/platform-agnostic-identify-eth-port.md %}

##  Prerequisites
{{site.data.alerts.note}}
{{site.jumboFramesPrereq}}
{{site.data.alerts.end}}

Your node requires the following resources.
* A network switch with the following specifications:

  * {{include.ethernetSpeed}} Ethernet
  
  * Fully non-blocking architecture

  * IPv6 capability

* Compatible networking cables

* A sufficient number of ports for connecting all nodes to the same switch fabric

* One static IP for each node, for each defined VLAN


## Recommended Configuration
{{site.unifyNetDefine}} However, for greater reliability, we recommend connecting both {{include.ethernetSpeed}} ports on every node to each switch.

We recommend the following configuration for your node.

* Your Qumulo MTU configured to match your client environment

* Two physical connections for each node, one connection for each redundant switch

* One Link Aggregation Control Protocol (LACP) port-channel for each network on each node, with the following configuration

  * Active mode

  * Slow transmit rate

  * Access port or trunk port with a native VLAN

* DNS servers

* A Network Time Protocol (NTP) server

* Firewall protocols or ports allowed for proactive monitoring

* Where `N` is the number of nodes, `N-1` floating IP addresses for each node, for each client-facing VLAN


## Connecting to Redundant Switches
For redundancy, we recommend connecting your cluster to dual switches. If either switch becomes inoperative, the cluster is still be accessible from the remaining switch.

* Connect the two NIC ports {% unless page.platform == 'gold' %}(2 &#215; {{include.ethernetSpeed}}){% endunless %} on your nodes to separate switches.

* The uplinks to the client network must equal the bandwidth from the cluster to the switch.

* The two ports form an LACP port channel by using a multi-chassis link aggregation group.

* Use an appropriate inter-switch link or virtual port channel.


## Connecting to a Single Switch
You can connect a your cluster to a single switch. If this switch becomes inoperative, the entire cluster becomes inaccessible.

* Connect the two NIC ports {% unless page.platform == 'gold' %}(2 &#215; {{include.ethernetSpeed}}){% endunless %} on your nodes to a single switch.

* The uplinks to the client network must equal the bandwidth from the cluster to the switch.

* The two ports form an LACP port channel. 


## Four-Node Cluster Architecture Diagram
The following is the recommended configuration for a four-node cluster connected to an out-of-band management switch and redundant switches.
