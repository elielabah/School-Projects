ping_target_host:
  cmd.run:
    - name: ping -c 3 192.168.245.100
    - ignore_retcode: True

check_target_in_arp:
  cmd.run:
    - name: ip neigh show | grep 192.168.245.100 || echo 'Not found in ARP'
