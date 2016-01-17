/etc/ssl/private/rainmaker.pem:
  file.managed:
    - source: salt://{{ sls|replace(".", "/") }}/files/rainmaker.pem
    - user: root
    - group: root
    - mode: 644
    - replace: True

haproxy-repo:
  pkgrepo.managed:
    - ppa: "ppa:vbernat/haproxy-1.5"

haproxy-packages:
  pkg.installed:
    - pkgs:
      - haproxy

/etc/haproxy/haproxy.cfg:
  file.managed:
    - source: salt://{{ sls|replace(".", "/") }}/files/haproxy.cfg
    - user: root
    - group: root
    - mode: 644
    - replace: True

/etc/default/haproxy:
  file.managed:
    - source: salt://{{ sls|replace(".", "/") }}/files/defaults
    - user: root
    - group: root
    - mode: 644
    - replace: True

haproxy-service:
  service.running:
    - name: mysql
    - enable: True
    - reload: True
