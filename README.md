# OCI Image with GraalVM and Native Image
Custom Images for Builder Native Image for Tekton Task Process

Image build with default:

WORKDIR ***/workspace/target***

ENTRYPOINT _/bin/bash_

CMD _native-image-compiler.sh_


|Environment Vars|Description|
|---|---|
|NATIVE_OPTIONS| set adicional native image options for build: _--enable-https_|
|NATIVE_RESOURCES| set the ResourceConfigurationFiles if uses resources set yours files _resources-config.json_|
|NATIVE_REFLECTION| set the ResourceConfigurationFiles if uses reflection set yours files _reflection-config.json_|
|JAR_APP| if copy multiples jar files, you must be set a jar with mainclass|


### Docker run
```
docker pull demonioazteka/native-image-builder:latest

docker run --env NATIVE_RESOURCES="reflection-config.json" -v MY_JAVA_BUILD_DIR:/workspace/target demonioazteka/native-image-builder 
```