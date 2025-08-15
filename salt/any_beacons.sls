/etc/salt/minion.d/beacons.conf:
  file.managed:
    - source: salt://beacons/beacons.conf
    - user: root
    - group: root
    - mode: 644
