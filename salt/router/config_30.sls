basic-network-config:
  cmd.run:
    - name: |
        /bin/vbash -c '
        source /opt/vyatta/etc/functions/script-template
        configure
        set interfaces ethernet eth0 address 192.168.245.30/24
        set interfaces ethernet eth0 description "WAN Interface"
        set interfaces ethernet eth1 address 172.16.0.1/24
        set interfaces ethernet eth1 description "LAN Interface"
        set protocols static route 0.0.0.0/0 next-hop 192.168.245.1
        set system name-server 1.1.1.1
        set system name-server 8.8.8.8
        set system name-server 192.168.245.2
        set system host-name my-vyos-router
        set system domain-name mydomain.local
        set system time-zone UTC
        commit
        save
        exit
        '
