backup-config:
  cmd.run:
    - name: |
        mkdir -p /config/backup
        configure
        run show configuration commands > /config/backup/config-$(date +%F).conf
        exit
