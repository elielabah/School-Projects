firewall_rules:
  allow:
    # Accès SSH pour l'administration distante
    - ssh
    - 22

    # Ports SaltStack (minion ↔ master)
    - 4505
    - 4506

    # Serveur DHCP (port 67 UDP pour le serveur)
    - 67/udp

    # Serveur DNS (port 53 UDP et TCP)
    - 53
    - 53/udp
    - 53/tcp

    # NTP (synchronisation horaire)
    - 123
    - 123/udp

    # HTTP et HTTPS (serveur web Apache ou accès à Internet)
    - 80
    - 443

    # ICMP : ping (autorisé par défaut mais on le note)
    - icmp

    # Pour les outils de diagnostic comme Netcat, traceroute, mtr
    - 33434:33534/udp   
    - 5201              
    - 8080              

  deny:
    # Interdire Telnet (non sécurisé)
    - 23

    # Blocage d'anciens protocoles vulnérables
    - 137
    - 138
    - 139
    - 445

    # Bloquer les ports inutilisés typiques (si non utilisés)
    - 21      
    - 25       
    - 110     
    - 143     

  enabled: True
