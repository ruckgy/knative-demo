cd $(dirname $0)
# Installing CRDs
#kubectl apply -f https://github.com/triggermesh/triggermesh-core/releases/latest/download/triggermesh-core-crds.yaml
kubectl apply -f https://github.com/triggermesh/triggermesh/releases/latest/download/triggermesh-crds.yaml

# Installing Triggermesh controllers
#kubectl apply -f https://github.com/triggermesh/triggermesh-core/releases/latest/download/triggermesh-core.yaml
kubectl apply -f https://github.com/triggermesh/triggermesh/releases/latest/download/triggermesh.yaml

kubectl wait deployment/triggermesh-controller --for=condition=Available --timeout=300s -n triggermesh
kubectl wait deployment/triggermesh-webhook --for=condition=Available --timeout=300s -n triggermesh
kubectl get crds |grep triggermesh
