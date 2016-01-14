build drupal solr core:
  cmd.script:
    - name: salt://{{ sls|replace(".", "/") }}/files/build-drupal-solr-core.sh
    - args: {{ salt['pillar.get']('drupal_apachesolr_corename', 'drupal') }} {{ salt['pillar.get']('drupal_apachesolr_version', '7.x-1.7') }} {{ salt['pillar.get']('drupal_apachesolr_corename', 'http://ftp.drupal.org/files/projects/apachesolr-7.x-1.7.tar.gz') }}

remove demo core:
  cmd.run:
    - name: rm -Rf /var/lib/solr/collection1
    - unless: 'test $(ls -d /var/lib/solr/collection1) != "/var/lib/solr/collection1"'
    
