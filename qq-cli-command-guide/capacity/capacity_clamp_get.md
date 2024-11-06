---
category: capacity
command: capacity_clamp_get
optional_options: []
permalink: /qq-cli-command-guide/capacity/capacity_clamp_get.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq capacity_clamp_get</code> command.
synopsis: Get the capacity clamp value in bytes, which can be set via PUT API or during
  cluster creation. When the cluster provisions more pstores, it will take this value
  into account. The cluster will not provision new pstores if the usable capacity
  would exceed this value.
title: qq capacity_clamp_get
usage: qq capacity_clamp_get [-h]
zendesk_source: qq CLI Command Guide

---