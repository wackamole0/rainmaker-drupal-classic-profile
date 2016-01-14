install uploadprogress:
  cmd.run:
    - name: pecl install uploadprogress
    - unless: test '$(pecl install -p uploadprogress | fgrep -i "already installed") != ""'

/etc/php5/mods-available/uploadprogress.ini:
  file.managed:
    - source: salt://{{ sls|replace(".", "/") }}/files/uploadprogress.ini
    - user: root
    - group: root
    - mode: 644
    - replace: True

enable uploadprogress:
  cmd.run:
    - name: php5enmod uploadprogress
