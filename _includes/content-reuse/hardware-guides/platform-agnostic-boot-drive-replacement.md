1. To get the correct version of the Qumulo Core Installer for the node in your cluster, {{site.contactQumuloCare}}.

{% if page.platform == 'gold' %}
1. [Create a Qumulo Core USB Drive Installer](../gold-tier-hardware-servicing-guide/getting-started/creating-usb-drive-installer.html).
{% else %}
1. [Create a Qumulo Core USB Drive Installer](../getting-started/creating-usb-drive-installer.html).
{% endif %}

1. Power on your node, enter the boot menu, and select your USB drive.

   The Qumulo Core Installer begins to run automatically.
   
1. When prompted, take the following steps:

   1. Select `[x] Perform maintenance`.

   1. Select `[1] Boot drive reset`.

   The Qumulo Core Installer initializes the boot drive.

1. After the process is complete reboot your node.

   Your node rejoins the cluster automatically.
