#!/bin/sh

# VARIABLES
########################################
TSD="$SNAP_USER_DATA/TunerStudioMS/"

# JAVA PATHS
########################################
export JAVA_HOME=$SNAP/usr/lib/jvm/java-1.8.0-openjdk-$SNAP_ARCH
export PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH
########################################


# GET TunerStudio if it doesn't exist then START

if [ -e ${TSD} ];

then

  cd ${TSD}
  
  # START
  java -jar -Dcom.ibm.crypto.provider.DoRSATypeChecking=false TunerStudioMS.jar
  
else

  # GET TunerStudio
  wget -O TunerStudio.tar.gz https://www.efianalytics.com/TunerStudio/download/TunerStudioMS_v3.1.04.tar.gz
  tar xvzf TunerStudio.tar.gz
  
  # CLEAN UP
  rm -rf TunerStudio.tar.gz
  
  # START
  cd ${TSD}
  java -jar -Dcom.ibm.crypto.provider.DoRSATypeChecking=false TunerStudioMS.jar
  
fi

