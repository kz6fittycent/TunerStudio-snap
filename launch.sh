#!/bin/sh

# VARIABLES
########################################
TSD="$SNAP_USER_DATA/TunerStudioMS"
TSL="TunerStudio.tar.gz https://www.efianalytics.com/TunerStudio/download/TunerStudioMS_v3.1.04.tar.gz"
TS="TunerStudio.tar.gz"

########################################

# JAVA PATHS
########################################
export JAVA_HOME=$SNAP/usr/lib/jvm/java-1.8.0-openjdk-$SNAP_ARCH
export PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH
########################################


# GET TunerStudio if it doesn't exist then START

if [ -e ${TSD} ];

then
  
  # START
  java -jar -Dcom.ibm.crypto.provider.DoRSATypeChecking=false ${TSD}/TunerStudioMS.jar
  
else

  # GET TunerStudio
  curl -so ${TS} ${TSL}
  tar xvzf ${TS} -C ${TSD}
  
  # CLEAN UP
  rm -rf ${TS}
  
  # START
  java -jar -Dcom.ibm.crypto.provider.DoRSATypeChecking=false ${TSD}/TunerStudioMS.jar
  
fi

