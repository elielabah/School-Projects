# Désinstalle uniquement les composants utilisés dans les fichiers montrés (diagnostic, services, dhcp, ntp, etc.)

remove_packages_used:
  pkg.removed:
    - pkgs:
      - net-tools          
      - iputils-ping       
      - dnsutils           
      - netcat-openbsd     
      - isc-dhcp-server    
      - ntp                
      - ntpdate            
      - ufw                

# Désactivation uniquement des services ciblés

stop_services:
  service.dead:
    - names:
      - ssh
      - isc-dhcp-server
      - ntp

# Désactive UFW si actif

disable_ufw:
  cmd.run:
    - name: ufw disable
    - onlyif: "ufw status | grep -q 'Status: active'"
