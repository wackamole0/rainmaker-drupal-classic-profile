mysqltuner-repo:
  git.latest:
    - name: https://github.com/major/MySQLTuner-perl.git
    - rev: master
    - target: /opt/mysqltuner

make mysqltuner executable:
  cmd.run:
    - name: chmod a+x /opt/mysqltuner/mysqltuner.pl

/usr/local/bin/mysqltuner:
  file.symlink:
    - target: /opt/mysqltuner/mysqltuner.pl
