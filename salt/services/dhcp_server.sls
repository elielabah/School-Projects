{% set iface = 'ens33' %}
{% set dhcp_config_file = '/etc/dhcp/dhcpd.conf' %}
{% set iface_config_file = '/etc/default/isc-dhcp-server' %}

install_dhcp_server:
  pkg.installed:
    - name: isc-dhcp-server

configure_dhcp_file:
  file.managed:
    - name: {{ dhcp_config_file }}
    - source: salt://services/templates/dhcpd.conf.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: '0644'
    - require:
      - pkg: install_dhcp_server

configure_dhcp_interface:
  file.replace:
    - name: {{ iface_config_file }}
    - pattern: '^INTERFACESv4=.*'
    - repl: 'INTERFACESv4="{{ iface }}"'
    - append_if_not_found: True
    - require:
      - pkg: install_dhcp_server

start_dhcp_service:
  service.running:
    - name: isc-dhcp-server
    - enable: True
    - watch:
      - file: configure_dhcp_file
      - file: configure_dhcp_interface
