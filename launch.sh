#!/bin/sh

# VARIABLES
########################################
TSD="$SNAP_USER_DATA/TunerStudioMS"
TSL="https://www.efianalytics.com/TunerStudio/download/TunerStudioMS_v3.1.04.tar.gz"
TS="TunerStudio.tar.gz"
SERIAL_DRIVER="${TSD}/lib/alternateLinuxDrivers/x86_64-linux:"
########################################

# JAVA PATH
########################################
export JAVA_HOME=$SNAP/usr/lib/jvm/java-1.8.0-openjdk-$SNAP_ARCH
export PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH
########################################


# GET TunerStudio if it doesn't exist then START

if [ -e "${TSD}" ];

then

  # CLEAN UP
  rm -rf ${TS}
  
  # START
  java -Dcom.ibm.crypto.provider.DoRSATypeChecking=false -Djava.library.path=${SERIAL_DRIVER}lib -cp ".:lib:plugins" -jar ${TSD}/TunerStudioMS.jar
  
else

  # GET TunerStudio
  curl -so $SNAP_USER_DATA/${TS} ${TSL}
  tar xvzf $SNAP_USER_DATA/${TS}
  
  # CLEAN UP
  rm -rf $SNAP_USER_DATA/${TS}
  
  # START
  java -Dcom.ibm.crypto.provider.DoRSATypeChecking=false -Djava.library.path=${SERIAL_DRIVER}lib -cp ".:lib:plugins" -jar ${TSD}/TunerStudioMS.jar TunerStudioMS.jar
  
fi

