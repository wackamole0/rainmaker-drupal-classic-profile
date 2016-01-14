drush-packages:
  pkg.installed:
    - pkgs:
      - zip
      - unzip
      - php-console-table

drush-repo:
  git.latest:
    - name: https://github.com/drush-ops/drush.git
    - rev: 6.5.0
    - target: /opt/drush

make drush executable:
  cmd.run:
    - name: chmod a+x /opt/drush/drush

/usr/local/bin/drush:
  file.symlink:
    - target: /opt/drush/drush
