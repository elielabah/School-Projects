deploy_schedule_conf:
  file.managed:
    - name: /etc/salt/minion.d/schedule.conf
    - source: salt://schedules/schedule.conf
    - user: root
    - group: root
    - mode: 644

restart_minion:
  service.running:
    - name: salt-minion
    - enable: True
    - watch:
      - file: deploy_schedule_conf
