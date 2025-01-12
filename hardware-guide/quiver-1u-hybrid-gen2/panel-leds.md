---
title: "Panel LEDs on Quiver 1U Hybrid Gen2 Nodes"
summary: "This section explains the LEDs on Quiver 1UH Gen2 nodes."
permalink: /hardware-guide/quiver-1u-hybrid-gen2/panel-leds.html
sidebar: hardware_guide_sidebar
---

## Front Panel LEDs and Buttons

On the front, right side of your node, there are four LEDs.

| Label                 | Color and Behavior  | Description               |
| --------------------- | ------------------- | ------------------------- |
| Power Button with LED | {{site.led.blue}} (solid blue)     | On                        |
| Power Button with LED | {{site.led.blue}} (blinking blue)  | Standby or sleep          |
| ID LED                | Off                 | No ID requested           |
| ID LED                | {{site.led.blue}} (solid blue)     | Selected unit ID          |
| Status LED            | Off                 | Operation normal          |
| Status LED            | {{site.led.orange}} (solid amber)    | DC off and critical error |
| Status LED            | {{site.led.orange}} (blinking amber) | DC on and critical error  |
| HDD Row LED           | Off                 | Operation normal          |
| HDD Row LED           | {{site.led.orange}} (blinking amber) | Fault                     |


## NVMe Drive Carrier LEDs

Each NVMe drive carrier has one LED.

| Color or Behavior | Description   |
| ----------------- | ------------- |
| {{site.led.blue}} (solid blue)   | Drive present |
| {{site.led.orange}} (solid amber)  | Drive failed  |
| Off               | Slot empty    |
