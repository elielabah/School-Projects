update-vyos:
  cmd.run:
    - name: |
        add system image http://mon-serveur/vyos-1.4.iso

restore-config:
  cmd.run:
    - name: |
        configure
        load /config/backup/config-YYYY-MM-DD.conf
        commit
        save
        exit
    - require:
      - cmd: update-vyos
