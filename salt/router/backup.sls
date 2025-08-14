backup-config:
  cmd.run:
    - name: |
        /bin/vbash -c '
        source /opt/vyatta/etc/functions/script-template
        save /config/backup/config-$(date +%F).conf
        '
