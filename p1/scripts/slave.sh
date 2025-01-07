#!/usr/bin/env bash

MASTER_IP="192.168.56.110"

# SSH configuration
mkdir -p /root/.ssh
mv /tmp/id_ed25519* /root/.ssh
chmod 400 /root/.ssh/id_ed25519*
chown root:root /root/.ssh/id_ed25519*
cat /root/.ssh/id_ed25519.pub >> /root/.ssh/authorized_keys
chmod 400 /root/.ssh/authorized_keys
chown root:root /root/.ssh/authorized_keys


# Conf Kubernetis
TOKEN=$(ssh "-o StrictHostKeyChecking=no" "root@$MASTER_IP" "sudo cat /var/lib/rancher/k3s/server/node-token")
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="agent --server https://$MASTER_IP:6443 -t $TOKEN --node-ip=192.168.56.111" sh -