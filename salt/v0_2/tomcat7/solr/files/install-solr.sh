#!/usr/bin/env bash

if [[ $1 == "" ]] || [[ $2 == "" ]]; then
    echo 'install-solr.sh <solr_version> <solr_download_url>'
    exit 1;
fi

solr_version=$1
solr_download_url=$2
solr_download_file="/tmp/solr-${solr_version}.tgz"
solr_download_unpacked_path="/tmp/solr-${solr_version}"
solr_install_path="/opt/solr-${solr_version}"
solr_war_filename="solr-${solr_version}.war"

if [ ! -d $solr_install_path ]; then
    wget "$solr_download_url" -O $solr_download_file
    cd /tmp
    tar -xzf $solr_download_file
    mv $solr_download_unpacked_path $solr_install_path
fi

if [ -h /opt/solr ] && [ $(readlink /opt/solr) != $solr_install_path ]; then
    unlink /opt/solr
fi

if [ ! -h /opt/solr ]; then
    ln -s $solr_install_path /opt/solr
fi

for f in /usr/share/tomcat7/lib/*; do
    if [ -h $f ]; then
        symlink_target=$(readlink $f)
        if [[ $symlink_target =~ '/opt/solr' ]]; then
            unlink $f
        fi
    fi
done

for f in /opt/solr/example/lib/ext/*; do
    ln -s $f /usr/share/tomcat7/lib/
done

if [ ! -h /var/lib/tomcat7/conf/log4j.properties ]; then
    ln -s /opt/solr/example/resources/log4j.properties /var/lib/tomcat7/conf/
fi

if [ ! -h /opt/solr/dist/solr.war ]; then
    cd $solr_install_path/dist
    ln -s $solr_war_filename solr.war
fi

if [ ! -h /var/lib/tomcat7/webapps/solr.war ]; then
    ln -s /opt/solr/dist/solr.war /var/lib/tomcat7/webapps/solr.war
fi

if [ ! -d /var/lib/solr ]; then
    mkdir /var/lib/solr
    rsync -av /opt/solr/example/solr/ /var/lib/solr/
    chown -R tomcat7:tomcat7 /var/lib/solr
    chmod -R u+rw /var/lib/solr
    chmod go-rwx /var/lib/solr
fi

if [ -f $solr_download_file ]; then
    unlink $solr_download_file
fi
