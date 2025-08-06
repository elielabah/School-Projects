set_static_ip_netplan2:
  file.managed:
    - name: /etc/netplan/01-netcfg.yaml
    - contents: |
        network:
          version: 2
          renderer: networkd
          ethernets:
            ens33:
              dhcp4: no
              addresses:
                - 192.168.245.159/24
              gateway4: 192.168.245.2
              nameservers:
                addresses:
                  - 192.168.245.2
                  - 8.8.8.8
                  - 8.8.4.4
    - mode: '0644'

apply_netplan_config_ubuntu2:
  cmd.run:
    - name: netplan apply
    - require:
      - file: set_static_ip_netplan2
