#!/usr/bin/env bash

mkdir -p /root/.ssh
mv /tmp/id_ed25519* /root/.ssh

chmod 400 /root/.ssh/id_ed25519*
chown root:root /root/.ssh/id_ed25519*

cat /root/.ssh/id_ed25519.pub >> /root/.ssh/authorized_keys
chmod 400 /root/.ssh/authorized_keys
chown root:root /root/.ssh/authorized_keys

apt-get install -y curl wget

echo "Téléchargement de K3s..."
curl -sfL https://get.k3s.io | sh -