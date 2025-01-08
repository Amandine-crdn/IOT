#!/usr/bin/env bash

# Conf Kubernetis
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --tls-san master --node-ip 192.168.56.110 --bind-address=192.168.56.110 --advertise-address=192.168.56.110" sh -

kubectl apply -f /vagrant/config/web.yaml
