docker stop dropbox 2>/dev/null
docker rm dropbox 2>/dev/null
docker run -it --rm \
  --privileged \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  --mount type=bind,source="$HOME",target="$HOME" \
  -u $USER \
  --workdir=$HOME \
  --name=dropbox \
  dropbox_img bash -c "DISPLAY= dropbox start -i && sleep infinity"
