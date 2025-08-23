vyos_firewall_block_http_https_except_ssh:
  cmd.run:
    - name: |
        /usr/bin/vbash -c '
        source /opt/vyatta/etc/functions/script-template
        configure
        set firewall ipv4 name BLOCK-WEB default-action accept
        set firewall ipv4 name BLOCK-WEB rule 10 action drop
        set firewall ipv4 name BLOCK-WEB rule 10 protocol tcp
        set firewall ipv4 name BLOCK-WEB rule 10 destination port 80
        set firewall ipv4 name BLOCK-WEB rule 20 action drop
        set firewall ipv4 name BLOCK-WEB rule 20 protocol tcp
        set firewall ipv4 name BLOCK-WEB rule 20 destination port 443
        set interfaces ethernet eth1 firewall ipv4 in name BLOCK-WEB
        commit
        save
        exit'
