#!/bin/bash
apt-get update && apt-get install -y curl libdigest-sha-perl
curl https://get.gravitational.com/teleport-v4.2.1-linux-amd64-bin.tar.gz.sha256
curl -O https://get.gravitational.com/teleport-v4.2.1-linux-amd64-bin.tar.gz
shasum -a 256 teleport-v4.2.1-linux-amd64-bin.tar.gz
tar -xzf teleport-v4.2.1-linux-amd64-bin.tar.gz
cd teleport
./install
cp /tmp/teleport.yml /etc/teleport.yml
cp /tmp/teleport.service /etc/systemd/system/
systemctl enable teleport.service
