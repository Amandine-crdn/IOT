#!/usr/bin/env bash

# Conf Kubernetis
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--node-ip 192.168.56.110" sh -
kubectl apply -f /vagrant/config/web1.yaml
kubectl apply -f /vagrant/config/ingress.yaml