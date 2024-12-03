{{site.data.alerts.tip}}To identify the <code>eth</code> port, run the following command:<div class="language-bash highlighter-rouge"><div class="highlight"><pre class="highlight manual"><code>for i in /sys/class/net/eth*; \
  do echo $i; \
  cat $i/device/uevent | \
  grep -i pci_slot; \
  done</code></pre></div></div>{{site.data.alerts.end}}
