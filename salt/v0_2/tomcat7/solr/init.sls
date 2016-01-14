install solr:
  cmd.script:
    - name: salt://{{ sls|replace(".", "/") }}/files/install-solr.sh
    - args: {{ salt['pillar.get']('solr_version', '4.10.4') }} {{ salt['pillar.get']('solr_download_url', 'http://apache.mirror.anlx.net/lucene/solr/4.10.4/solr-4.10.4.tgz') }}

/etc/tomcat7/Catalina/localhost/solr.xml:
  file.managed:
    - source: salt://{{ sls|replace(".", "/") }}/files/solr.xml
    - user: root
    - group: root
    - mode: 644
    - replace: True
