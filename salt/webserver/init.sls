apache2:
  pkg.installed: []

apache_service:
  service.running:
    - name: apache2
    - enable: true
    - require:
      - pkg: apache2
