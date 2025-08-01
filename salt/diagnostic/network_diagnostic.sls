test_ping_gateway:
  cmd.run:
    - name: ping -c 3 192.168.245.2
    - failhard: False

test_download_speed:
  cmd.run:
    - name: wget -O /dev/null http://speedtest.tele2.net/1MB.zip
    - failhard: False

show_routing_table:
  cmd.run:
    - name: ip route
    - failhard: False

show_interface_stats:
  cmd.run:
    - name: ip -s link show ens33
    - failhard: False
