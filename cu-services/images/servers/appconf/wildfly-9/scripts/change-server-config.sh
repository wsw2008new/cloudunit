#!/bin/bash

export MEMORY_VALUE=$1
export JVM_OPTIONS=$2

/cloudunit/scripts/cu-stop.sh

sed -i 's/JAVA_OPTS=.*$/JAVA_OPTS="-Xms'$MEMORY_VALUE'm -Xmx'$MEMORY_VALUE'm -XX:MetaspaceSize=96M -XX:MaxMetaspaceSize=256m -Djava.net.preferIPv4Stack=true -Djboss.modules.system.pkgs=$JBOSS_MODULES_SYSTEM_PKGS -Djava.awt.headless=true '"$2"'"/g' /etc/environment

source /etc/environment
/cloudunit/scripts/cu-start.sh




