xhost local:root
docker run -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    --device /dev/snd \
    --device /dev/dri/card0 \
    --device /dev/dri/card1 \
    --device /dev/video0 \
    --group-add audio \
    --group-add video \
    --name cathode \
    jess/1995
