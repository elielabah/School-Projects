network:
  ubuntu0:
    interface: ens33
    ipaddr: 192.168.245.157
    netmask: 255.255.255.0
    gateway: 192.168.245.2
    dns:
      - 192.168.245.2
      - 8.8.8.8
      - 8.8.4.4

  ubuntu1:
    interface: ens33
    ipaddr: 192.168.245.159
    netmask: 255.255.255.0
    gateway: 192.168.245.2
    dns:
      - 192.168.245.2
      - 8.8.8.8
      - 8.8.4.4
  ubuntu2:
    interface: ens33
    ipaddr: 192.168.245.150
    netmask: 255.255.255.0
    gateway: 192.168.245.2
    dns:
      - 192.168.245.2
      - 8.8.8.8
      - 8.8.4.4
