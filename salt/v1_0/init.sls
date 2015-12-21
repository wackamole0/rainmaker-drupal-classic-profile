include:
  - rainmaker/core/branch/v1_0
  #- rainmaker/branch/rainmaker/drupal-classic/v1_0/mariadb

/var/www/:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

/var/www/html:
  file.directory:
    - user: rainmaker
    - group: rainmaker
    - mode: 755
    - makedirs: True
