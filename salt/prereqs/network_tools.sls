# Outils de diagnostic réseau
install_ping:
  pkg.installed:
    - name: iputils-ping

install_nslookup:
  pkg.installed:
    - name: dnsutils

install_netcat:
  pkg.installed:
    - name: netcat-openbsd

install_traceroute:
  pkg.installed:
    - name: traceroute

install_mtr:
  pkg.installed:
    - name: mtr-tiny

# Outils IP et interfaces
install_net_tools:
  pkg.installed:
    - name: net-tools

install_iproute2:
  pkg.installed:
    - name: iproute2

# Pare-feu et sécurité
install_ufw:
  pkg.installed:
    - name: ufw

# Synchronisation de l’heure
install_chrony:
  pkg.installed:
    - name: chrony

# Serveurs web et DNS (pour compatibilité)
install_apache2:
  pkg.installed:
    - name: apache2

install_bind9:
  pkg.installed:
    - name: bind9

install_dhcp_server:
  pkg.installed:
    - name: isc-dhcp-server

# Outils CLI utiles à tous les scripts
install_curl:
  pkg.installed:
    - name: curl

install_wget:
  pkg.installed:
    - name: wget

install_htop:
  pkg.installed:
    - name: htop

install_tcpdump:
  pkg.installed:
    - name: tcpdump

install_logrotate:
  pkg.installed:
    - name: logrotate

# Nettoyage et compression
install_zip_tools:
  pkg.installed:
    - pkgs:
      - zip
      - unzip
      - tar
      - gzip
