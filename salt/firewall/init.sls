# firewall/init.sls

{% set fw_all = salt['pillar.get']('firewall_rules', {}) %}
{% set allow = fw_all.get('allow', []) %}
{% set deny = fw_all.get('deny', []) %}
{% set enabled = fw_all.get('enabled', False) %}

{% if enabled %}
# Installation de UFW
ufw_pkg:
  pkg.installed:
    - name: ufw

# Activation de UFW si non actif
ufw_enable:
  cmd.run:
    - name: ufw --force enable
    - unless: 'ufw status | grep -q "Status: active"'
    - require:
      - pkg: ufw_pkg

# Ajout des règles autorisées
{% for item in allow %}
ufw_allow_{{ loop.index }}:
  cmd.run:
    - name: ufw allow {{ item }}
    - unless: 'ufw status | grep -q "{{ item }}"'
    - require:
      - cmd: ufw_enable
{% endfor %}

# Ajout des règles à interdire
{% for item in deny %}
ufw_deny_{{ loop.index }}:
  cmd.run:
    - name: ufw deny {{ item }}
    - unless: 'ufw status | grep -q "{{ item }}"'
    - require:
      - cmd: ufw_enable
{% endfor %}

{% else %}
firewall_disabled:
  test.succeed_without_changes:
    - name: "Firewall non activé (clé 'enabled' absente ou à False dans le pillar)"
{% endif %}
