# Config argocd avec le repo

kubectl create namespace dev
kubectl apply -f ../config/dev-project.yaml -n argocd
kubectl apply -f ../config/dev-application.yaml -n argocd

echo "kubectl  --insecure-skip-tls-verify  port-forward -n dev svc/wil-playground 8888:8888"