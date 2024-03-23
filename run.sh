#!/bin/bash

docker run -it --rm \
	-v .:/home/designer/DC23-LTC2-LDO \
	-e PDK=gf180mcuD \
	-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
	--net=host \
	-e DISPLAY \
	-e XDG_RUNTIME_DIR \
	-e PULSE_SERVER \
	akilesalreadytaken/chipathon-tools bash
