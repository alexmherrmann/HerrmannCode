xhost local:root
docker run -it \
    --net host \
    --cpuset-cpus 1 \
    --memory 768mb \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME/Downloads:/root/Downloads \
    -v $HOME/.config/google-chrome/:/data \
    -e DISPLAY=unix$DISPLAY \
    --device /dev/snd \
    --device /dev/dri \
    --device /dev/video0 \
    --group-add audio \
    --group-add video \
    --name chrome \
    --security-opt seccomp:./chrome.json \
    jess/chrome
