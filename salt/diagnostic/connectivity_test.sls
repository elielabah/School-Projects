ping_internet:
  cmd.run:
    - name: ping -c 3 8.8.8.8

dns_resolution_google:
  cmd.run:
    - name: nslookup google.com

check_ssh_port:
  cmd.run:
    - name: nc -zv 127.0.0.1 22
    - ignore_retcode: True

check_salt_master_port_4505:
  cmd.run:
    - name: nc -zv 192.168.245.149 4505
    - ignore_retcode: True

check_salt_master_port_4506:
  cmd.run:
    - name: nc -zv 192.168.245.149 4506
    - ignore_retcode: True

