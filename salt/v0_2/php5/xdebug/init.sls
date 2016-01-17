php5-xdebug-package:
  pkg.installed:
    - pkgs:
      - php5-xdebug

/etc/php5/mods-available/xdebug.ini:
  file.managed:
    - source: salt://{{ sls|replace(".", "/") }}/files/xdebug.ini
    - user: root
    - group: root
    - mode: 644
    - replace: True

enable xdebug:
  cmd.run:
    - name: php5enmod xdebug
