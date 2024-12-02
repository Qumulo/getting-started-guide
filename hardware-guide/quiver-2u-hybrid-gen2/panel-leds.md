---
title: "Panel LEDs on Quiver 2U Hybrid Gen2 Nodes"
summary: "This section explains the LEDs on Quiver 2UH Gen2 nodes."
permalink: /hardware-guide/quiver-2u-hybrid-gen2/panel-leds.html
sidebar: hardware_guide_sidebar
---

## Front and Rear Panel LEDs and Buttons

For information about the front and rear panel LEDs and buttons, <a href="https://docs.qumulo.com/pdf/quiver-2uh-hybrid-rackmount-chassis-user-manual.pdf#page=11" class="pdf">Front Panel and Rear Panel (p. 11)</a> {{site.hardware.fromAIC}}.

## Rear LAN LEDs

On the back of your node, LAN LEDs are located behind the vent holes on the NIC. Each port has one light.

{{site.data.alerts.note}}
<ul>
  <li>{{site.noNIC}}</li>
  <li>Network traffic <em>doesn't</em> affect the speed of the light's blinking.</li>
</ul>
{{site.data.alerts.end}}


| Color            | Status             | Description      |
| ---------------- | ------------------ | ---------------- |
| &#8212;          | Off                | No link          |
| {{site.led.green}} (solid green) | On or blinking     | Link established |
