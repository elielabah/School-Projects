restore-config:
  cmd.run:
    - name: |
        /bin/vbash -c '
        source /opt/vyatta/etc/functions/script-template
        configure
        load $(ls -t /config/backup/config-*.conf | head -n 1)
        commit
        save
        exit
        '
