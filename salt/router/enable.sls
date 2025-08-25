vyos_firewall_block_http_https_except_ssh:
  cmd.run:
    - name: |
        /usr/bin/vbash -c '
        source /opt/vyatta/etc/functions/script-template
        configure
        delete interfaces ethernet eth0 firewall in name BLOCK-WEB
        commit
        save
        exit'
