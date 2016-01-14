drupal database:
  cmd.run:
    - name: mysql -u root -proot -e "CREATE DATABASE drupal CHARACTER SET utf8 COLLATE utf8_general_ci;"
    - unless: test "$(mysql -u root -proot -e "SHOW DATABASES" | fgrep drupal)" == "drupal"

drupal user local:
  cmd.run:
    - name: mysql -u root -proot -e "GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES ON drupal.* TO 'drupal'@'localhost' IDENTIFIED BY 'drupal';"

drupal user wild:
  cmd.run:
    - name: mysql -u root -proot -e "GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES ON drupal.* TO 'drupal'@'%' IDENTIFIED BY 'drupal';"
