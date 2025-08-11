# Configuration réseau de base sur VyOS.30
vyos_network_config:
  cmd.run:
    - name: |
        configure
        set system host-name vyos-router
        set system name-server 8.8.8.8
        set interfaces ethernet eth0 address 192.168.245.30/24
        commit
        save
        exit
