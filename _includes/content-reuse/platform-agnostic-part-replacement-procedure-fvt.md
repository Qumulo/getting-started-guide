{% unless page.platform contains 'quiver' %}
## To Perform the Part Replacement Procedure by Using the FVT
{{site.partReplaceDefine}}

  {% unless page.platform contains 'hpe' %}
  {% capture content_tag %}{{site.partReplaceDcms}}{% endcapture %}
  {% include note.html content=content_tag %}
  {% endunless %}
{% endunless %}

1. Boot by using the latest version of the Qumulo Core USB Drive Installer.

1. Select **[*] Perform maintenance**.
   
1. Select **[2] Perform automatic repair after part replacement (non-destructive)**.

{% unless page.platform contains 'q2uhg2' %}
   The part replacement procedure runs and the **FVT passed!** message appears.

{% include note.html content="In some cases, after the part replacement procedure, the message `FIX: Run the FVT flash command.` appears. Enter `1` as you would for a fixable issue to reboot the node and then repeat the part replacement procedure." %}
{% endunless %}

{% if page.platform contains 'q2uhg2' %}
   Follow the prompts to complete the chassis replacement.
{% endif %}
