{% if page.platform != 'quiver' %}
## To Perform the Part Replacement Procedure by Using the FVT
{{site.partReplaceDefine}}

  {% if page.platform != 'hpe' %}
  {% capture content_tag %}{{site.partReplaceDcms}}{% endcapture %}
  {% include note.html content=content_tag %}
  {% endif %}
{% endif %}

1. Boot by using the latest version of the Qumulo Core USB Drive Installer.

1. Select **[*] Perform maintenance**.
   
1. Select **[2] Perform automatic repair after part replacement (non-destructive)**.

   The part replacement procedure runs and the **FVT passed!** message appears.

{% include note.html content="In some cases, after the part replacement procedure, the message `FIX: Run the FVT flash command.` appears. Enter `1` as you would for a fixable issue to reboot the node and then repeat the part replacement procedure." %}
