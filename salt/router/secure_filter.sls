# Sécurité et filtrage sur VyOS*
vyos_security_config:
  cmd.run:
    - name: |
        configure

        # Pare-feu : blocage d'un sous-réseau
        set firewall name BLOCK rule 10 action drop
        set firewall name BLOCK rule 10 source address 192.168.1.0/24
        set interfaces ethernet eth0 firewall in name BLOCK

        # Autorisation HTTP & HTTPS
        set firewall name ALLOW rule 20 action accept
        set firewall name ALLOW rule 20 destination port 80,443
        set firewall name ALLOW rule 20 protocol tcp

        commit
        save
        exit
