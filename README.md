# nativescript-docker
Docker NativeScript Develpment


## Configure

Set configurations in docker.sh:

* CONTAINER_NAME - Set name of container
* APP_HOME - Set app home to run tns commands
* ANDROID_HOME - Set android sdk home if you not have environment variable already configured
* GRADLE_HOME - Set gradle home if you not have environment variable already configured

## Create container

Into Dockerfile folder, execute (change CONTAINER_NAME name that to prefer):

``` 
$ docker build -t CONTAINER_NAME .

```

## Command Execute 

### Container bash

* the first time that you tun tns, it asks to accept privacy policy. So that it does not happen at each access run shell, execute `tns` and accept. After commit changes:

```
$ ./docker.sh bash

$ tns

```

Commit in another terminal

```

$ docker commit IMAGE_ID CONTAINER_NAME

```

### Run tns

```

$ ./docker.sh tns run android --device DEVICE_ID

# or, if you set device id

./docker.sh run android

# and

./docker.sh livesync android

```
