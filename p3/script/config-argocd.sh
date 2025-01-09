k3d cluster create aspikrotty --api-port 6443 -p 8080:80@loadbalancer --agents 2
kubectl config use-context k3d-aspikrotty

# Creation namespace 
kubectl create namespace argocd

# Installation Argo-CD 
kubectl apply -n argocd -f ../config/argocd-install.yaml # install
kubectl apply -f ../config/argocd-ingress.yaml -n argocd # ou est ce que on y accede

# Config compte admin 
# creds = admin/aspikrotty

kubectl -n argocd patch secret argocd-secret -p '{"stringData":  {
    "admin.password": "$2a$12$.wdRSy84NfVsjOr9D/P0UONWYKTqSNUAlXwS.10.1kpVHIp3D1c5a",
    "admin.passwordMtime": "'$(date +%FT%T%Z)'"
}}'