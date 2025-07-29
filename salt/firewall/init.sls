{% set fw = pillar.get('firewall', {}) %}
{% if not fw %}
{%   do salt.log.warn('Aucun pillar firewall défini pour ' + grains['id']) %}
{% endif %}

# Installation et activation de UFW
ufw_pkg:
  pkg.installed:
    - name: ufw

ufw_enable:
  cmd.run:
    - name: ufw --force enable
    - unless: ufw status | grep -q "Status: active"
    - require:
      - pkg: ufw_pkg

# Boucle sur chaque règle du pillar
{% for name, rule in fw.get('rules', {}).items() %}
ufw_rule_{{ name }}:
  cmd.run:
    - name: ufw allow proto {{ rule.proto }} from any to any port {{ rule.port }}
    - unless: ufw status | grep -q "{{ rule.port }}"
    - require:
      - cmd: ufw_enable
{% endfor %}
