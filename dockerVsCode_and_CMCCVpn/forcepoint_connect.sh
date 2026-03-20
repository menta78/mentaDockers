cmcc_dns=192.168.120.10
sudo tee /etc/resolv.conf << EOF
nameserver $cmcc_dns
nameserver 8.8.8.8
EOF
sudo forcepoint-client 90.147.177.126 --user lm09621 --resolver /usr/bin/resolvectl
