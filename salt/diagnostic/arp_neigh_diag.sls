show_arp_table:
  cmd.run:
    - name: ip neigh show

arp_cache_stats:
  cmd.run:
    - name: cat /proc/net/arp

ping_common_gateway:
  cmd.run:
    - name: ping -c 2 192.168.245.2
    - ignore_retcode: True
