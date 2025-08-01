# Essai de récupération du pillar avec plusieurs possibilités
{% set fw = salt['pillar.get']('firewall_rules', salt['pillar.get']('firewall', {})) %}

{% if fw and fw.get('rules') %}
# Installation et activation de UFW
ufw_pkg:
  pkg.installed:
    - name: ufw

ufw_enable:
  cmd.run:
    - name: ufw --force enable
    - unless: 'ufw status | grep -q "Status: active"'
    - require:
      - pkg: ufw_pkg

# Boucle sur chaque règle du pillar
{% for name, rule in fw.get('rules', {}).items() %}
ufw_rule_{{ name }}:
  cmd.run:
    - name: ufw allow proto {{ rule.proto }} from any to any port {{ rule.port }}
    - unless: 'ufw status | grep -q "{{ rule.port }}"'
    - require:
      - cmd: ufw_enable
{% endfor %}

{% else %}
# Aucune configuration firewall trouvée
firewall_no_config:
  test.succeed_without_changes:
    - name: "Aucune configuration firewall trouvée dans les pillars"

{% endif %}
