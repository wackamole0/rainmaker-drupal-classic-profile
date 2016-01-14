memcached-packages:
  pkg.installed:
    - pkgs:
      - memcached

memcached-service:
  service.running:
    - name: memcached
    - enable: True
    - reload: True
