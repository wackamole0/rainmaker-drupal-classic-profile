install composer:
  cmd.run:
    - name: curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/opt --filename=composer

/usr/local/bin/composer:
  file.symlink:
    - target: /opt/composer
