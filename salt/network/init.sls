{% set cfg = salt['pillar.get']('network:' + grains['id'], {}) %}
{% if not cfg %}
{# Si aucune config du Pillar n’est trouvée, on log une alerte #}
{%   do salt.log.warn('Aucune configuration réseau pour ' + grains['id']) %}
{% endif %}

{{ cfg.interface }}:
  network.managed:
    - enabled: True        # On veut que Salt gère cette interface
    - type: eth            # Type Ethernet (interface:ens33)
    - proto: static        # IP statique
    - ipaddr: {{ cfg.ipaddr }}
    - netmask: {{ cfg.netmask }}
    - gateway: {{ cfg.gateway }}
    - dns: {{ cfg.dns }}
