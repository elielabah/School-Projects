vyos_firewall_remove:
  cmd.run:
    - name: >
        /bin/vbash -c "source /opt/vyatta/etc/functions/script-template 
        configure 
        delete interfaces ethernet eth1 firewall in 
        delete firewall name BLOCK-WEB 
        commit 
        save 
        exit"
