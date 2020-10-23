#!/bin/sh

# java paths
export JAVA_HOME=$SNAP/usr/lib/jvm/java-1.8.0-openjdk-$SNAP_ARCH
export PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH

cd $SNAP_USER_DATA/TunerStudioMS

# START TunerStudio

java -jar -Dcom.ibm.crypto.provider.DoRSATypeChecking=false TunerStudioMS.jar
