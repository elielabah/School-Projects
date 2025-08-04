install_ntp:
  pkg.installed:
    - name: chrony

configure_ntp:
  file.managed:
    - name: /etc/chrony/chrony.conf
    - source: salt://services/templates/chrony.conf.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: '0644'
    - require:
      - pkg: install_ntp

enable_ntp:
  service.running:
    - name: chrony
    - enable: True
    - watch:
      - file: configure_ntp
