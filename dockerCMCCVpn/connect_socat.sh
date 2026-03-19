#!/bin/bash
expect -c "
  spawn socat -,raw,echo=0 TCP:localhost:2222
  sleep 1
  send \"export TERM=xterm-256color\r\"
  send \"stty cols 220 rows 50\r\"
  send \"cd src/git/mentaDockers/dockerCMCCVpn\r\"
  interact
"
