apache-packages:
  pkg.installed:
    - pkgs:
      - apache2
      - apache2-utils

enable apache mod_rewrite:
  cmd.run:
    - name: a2enmod rewrite

/etc/apache2/mods-available/mpm_prefork.conf:
  file.managed:
    - source: salt://{{ sls|replace(".", "/") }}/files/mpm_prefork.conf
    - user: root
    - group: root
    - mode: 644
    - replace: True

apache-service:
  service.running:
    - name: apache2
    - enable: True
    - reload: True

fred:
  user.present:
    - name: rainmaker
    - groups:
      - www-data
