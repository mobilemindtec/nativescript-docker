#!/bin/bash

set -e

CMD="$@"

# app 
CONTAINER_NAME="" # set container name
APP_HOME="" # set app home

# android and gardle

if [ -z "$ANDROID_HOME" ]; then
	ANDROID_HOME="" # set android sdk home
fi

if [ -z "$GRADLE_HOME" ]; then
	GRADLE_HOME="" # set gradle home
fi

VOLUMES="
	-v /dev/bus/usb:/dev/bus/usb \
	-v $APP_HOME:/app \
	-v $ANDROID_HOME:/android-sdk \
	-v $GRADLE_HOME:/gradle
"

if [ $CMD == "bash" ]; then

	docker run -it \
		--rm --privileged \
		$VOLUMES \
		$CONTAINER_NAME bash

else		

	docker run -it \
		--rm --privileged \
		$VOLUMES \
		$CONTAINER_NAME bash -c "$CMD"	

fi	
