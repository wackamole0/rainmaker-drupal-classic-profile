php5-apache-packages:
  pkg.installed:
    - pkgs:
      - php5-imagick
      - imagemagick
      - libapache2-mod-php5

/etc/php5/apache2/php.ini:
  file.managed:
    - source: salt://{{ sls|replace(".", "/") }}/files/php.ini
    - user: root
    - group: root
    - mode: 644
    - replace: True

/etc/php5/mods-available/drupal.ini:
  file.managed:
    - source: salt://{{ sls|replace(".", "/") }}/files/php.drupal.ini
    - user: root
    - group: root
    - mode: 644
    - replace: True
