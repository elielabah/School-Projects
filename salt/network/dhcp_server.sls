# State Salt pour installer et configurer un serveur DHCP

# Installation du serveur DHCP
dhcp_package_install:
  pkg.installed:
    - name: isc-dhcp-server

# Configuration du serveur DHCP via template Jinja2
dhcp_main_config:
  file.managed:
    - name: /etc/dhcp/dhcpd.conf
    - source: salt://network/files/dhcpd.conf.j2
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: dhcp_package_install
    - watch_in:
      - service: dhcp_service

# Configuration de l'interface réseau pour DHCP
dhcp_interface_config:
  file.managed:
    - name: /etc/default/isc-dhcp-server
    - source: salt://network/files/isc-dhcp-server.j2
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: dhcp_package_install
    - watch_in:
      - service: dhcp_service

# Service DHCP
dhcp_service:
  service.running:
    - name: isc-dhcp-server
    - enable: True
    - require:
      - file: dhcp_main_config
      - file: dhcp_interface_config

# Test de validation du service
dhcp_service_test:
  cmd.run:
    - name: systemctl is-active isc-dhcp-server
    - require:
      - service: dhcp_service

# Vérification des logs DHCP
dhcp_logs_check:
  cmd.run:
    - name: tail -n 20 /var/log/syslog | grep dhcpd
    - ignore_retcode: True
    - require:
      - service: dhcp_service

# Backup de la configuration
dhcp_config_backup:
  cmd.run:
    - name: cp /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.backup.$(date +%Y%m%d-%H%M%S)
    - onlyif: test -f /etc/dhcp/dhcpd.conf
    - require:
      - file: dhcp_main_config
