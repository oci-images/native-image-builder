#!/bin/bash
echo "Graalvm Native Image Compiler"

export NI_OPTIONS="--no-server --no-fallback --allow-incomplete-classpath"
if [ ! -z "$NATIVE_OPTIONS" ]
then	
	export NI_OPTIONS="$NI_OPTIONS $NATIVE_OPTIONS"
fi

if [ ! -z "$NATIVE_RESOURCES" ]
then	
	export NI_RESOURCES=""
else	
	export NI_RESOURCES="-H:ResourceConfigurationFiles=$NATIVE_RESOURCES"
fi

if [ ! -z "$NATIVE_REFLECTION" ]
then	
	export NI_REFLECTION=""
else	
	export NI_REFLECTION="-H:ReflectionConfigurationFiles=$NATIVE_REFLECTION"
fi

filesnum=$(ls *.jar | wc -l)
if [ $filesnum = 1 ]; 
then
	jarfile=$(ls *.jar)
	echo "INFO exec native-image $NI_OPTIONS $NI_REFLECTION $NI_RESOURCES -jar $jarfile"
	native-image $NI_OPTIONS $NI_REFLECTION $NI_RESOURCES -jar $jarfile
else
	if [ -z "$JAR_APP" ]
	then	
		echo "Jar files: ${filesnum}, you must be set JAR_APP"
	else
		echo "INFO exec native-image $NI_OPTIONS $NI_REFLECTION $NI_RESOURCES -jar $JAR_APP"
		native-image $NI_OPTIONS $NI_REFLECTION $NI_RESOURCES -jar $JAR_APP
	fi	

fi