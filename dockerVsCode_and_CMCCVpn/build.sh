docker build --no-cache --build-arg USER=$(whoami) --build-arg USERID=$(id -u) -t vscode_pcmenta .
