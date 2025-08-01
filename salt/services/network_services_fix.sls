ensure_sshd_running:
  service.running:
    - name: ssh
    - enable: True

ensure_salt_minion_running:
  service.running:
    - name: salt-minion
    - enable: True

ensure_networkd_running:
  service.running:
    - name: systemd-networkd
    - enable: True

ensure_ufw_enabled:
  cmd.run:
    - name: ufw --force enable
    - unless: ufw status | grep -q 'Status: active'
