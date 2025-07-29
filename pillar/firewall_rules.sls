firewall:
  enabled: True
  rules:
    ssh:
      port: 22
      proto: tcp
      action: allow
    salt_master:
      port: 4505
      proto: tcp
      action: allow
    salt_return:
      port: 4506
      proto: tcp
      action: allow
