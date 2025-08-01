{% set cfg = salt['pillar.get']('network:' + grains['id'], {}) %}

{% if cfg %}
{{ cfg.interface }}:
  network.managed:
    - enabled: True
    - type: eth
    - proto: static
    - ipaddr: {{ cfg.ipaddr }}
    - netmask: {{ cfg.netmask }}
    - gateway: {{ cfg.gateway }}
    - dns: {{ cfg.dns }}
{% else %}
log_no_cfg:
  test.show_notification:
    - text: " Aucune configuration réseau trouvée pour {{ grains['id'] }} dans le pillar"
{% endif %}
