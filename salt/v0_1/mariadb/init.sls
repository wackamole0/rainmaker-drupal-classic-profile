mariadb-repo:
  pkgrepo.managed:
    - humanname: Mariadb
    - name: "deb http://ftp.osuosl.org/pub/mariadb/repo/10.0/ubuntu trusty main"
    - keyid: "0xcbcb082a1bb943db"
    - keyserver: keyserver.ubuntu.com

mariadb-server-debconf:
  debconf.set:
    - name: mariadb-server-10.0
    - data:
        'mysql-server/root_password': {'type': 'password', 'value': 'root'}
        'mysql-server/root_password_again': {'type': 'password', 'value': 'root'}

prevent mysql from starting automatically:
  cmd.run:
    - name: echo 'manual' > /etc/init/mysql.override

mariadb-packages:
  pkg.installed:
    - pkgs:
      - mariadb-server
      - mariadb-client

/etc/mysql/my.cnf:
  file.managed:
    - source: salt://{{ sls|replace(".", "/") }}/files/my.cnf
    - user: root
    - group: root
    - mode: 644
    - replace: True

allow mysql to start automatically:
  cmd.run:
    - name: unlink /etc/init/mysql.override

mariadb-service:
  service.running:
    - name: mysql
    - enable: True
    - reload: True
