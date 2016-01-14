tomcat7-packages:
  pkg.installed:
    - pkgs:
      - tomcat7
      - tomcat7-admin

/etc/tomcat7/tomcat-users.xml:
  file.managed:
    - source: salt://{{ sls|replace(".", "/") }}/files/tomcat-users.xml
    - user: root
    - group: tomcat7
    - mode: 640
    - replace: True

tomcat7-service:
  service.running:
    - name: tomcat7
    - enable: True
    - reload: True
