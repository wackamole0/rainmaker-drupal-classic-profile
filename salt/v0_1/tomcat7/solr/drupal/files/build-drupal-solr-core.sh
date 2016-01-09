#!/usr/bin/env bash

if [[ $1 == "" ]] || [[ $2 == "" ]] || [[ $3 == "" ]]; then
    echo 'build-drupal-solr-core.sh <corename> <apachesolr_version> <apachesolr_download_url>'
    exit 1;
fi

drupal_solr_corename=$1
drupal_apachesolr_version="7.x-1.7"
drupal_apachesolr_download_url="http://ftp.drupal.org/files/projects/apachesolr-7.x-1.7.tar.gz"
drupal_apachesolr_download_file="/tmp/apachesolr-${drupal_apachesolr_version}.tar.gz"
drupal_apachesolr_core_path="/var/lib/solr/${drupal_solr_corename}"

mkdir $drupal_apachesolr_core_path
rsync -av /opt/solr/example/solr/collection1/ $drupal_apachesolr_core_path/
echo "name=${drupal_solr_corename}" > $drupal_apachesolr_core_path/core.properties

wget $drupal_apachesolr_download_url -O $drupal_apachesolr_download_file
cd /tmp
tar -xzf $drupal_apachesolr_download_file
rsync -av /tmp/apachesolr/solr-conf/solr-4.x/ $drupal_apachesolr_core_path/conf/
chown -R tomcat7:tomcat7 $drupal_apachesolr_core_path
rm -Rf /tmp/apachesolr
unlink $drupal_apachesolr_download_file

