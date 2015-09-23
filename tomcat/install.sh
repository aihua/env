#!/bin/sh

groupadd tomcat
useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat

cd $CATALINA_HOME

rm -fr webapps/ROOT webapps/examples webapps/docs

chgrp -R tomcat conf
chmod g+rwx conf
chmod g+r conf/*
chown -R tomcat work/ temp/ logs/

initctl reload-configuration
initctl start tomcat
