/var/www:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

/var/www/html:
  file.directory:
    - user: rainmaker
    - group: www-data
    - mode: 2775
    - makedirs: True

/etc/apache2/sites-available/000-default.conf:
  file.managed:
    - source: salt://{{ sls|replace(".", "/") }}/files/default.conf
    - user: root
    - group: root
    - mode: 644
    - replace: True

enable php5 drupal settings:
  cmd.run:
    - name: php5enmod -s apache2 drupal
