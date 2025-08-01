check_networkd_status:
  cmd.run:
    - name: systemctl is-active systemd-networkd
    - ignore_retcode: True

check_sshd_status:
  cmd.run:
    - name: systemctl is-active ssh
    - ignore_retcode: True

check_salt_minion:
  cmd.run:
    - name: systemctl is-active salt-minion
    - ignore_retcode: True

check_ufw_status:
  cmd.run:
    - name: ufw status
    - ignore_retcode: True
