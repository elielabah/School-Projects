vyos_firewall_block_all_except_ssh_ipv4:
  cmd.run:
    - name: |
        /usr/bin/vbash -c '
        source /opt/vyatta/etc/functions/script-template
        configure
        set firewall ipv4 name BLOCK-ALL default-action drop
        set firewall ipv4 name BLOCK-ALL rule 10 action accept
        set firewall ipv4 name BLOCK-ALL rule 10 protocol tcp
        set firewall ipv4 name BLOCK-ALL rule 10 destination port 22
        set interfaces ethernet eth0 firewall in name BLOCK-ALL
        commit
        save
        exit'
