kubectl apply -f https://github.com/knative/operator/releases/download/knative-v1.12.0/operator.yaml
kubectl wait deployment/knative-operator --for=condition=Available --timeout=60s
kubectl apply -f serving.yml
kubectl wait KnativeServing/knative-serving --for=condition=Ready --timeout=300s -n knative-serving
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.12.0/serving-default-domain.yaml
kubectl apply -f eventing.yml
kubectl wait KnativeEventing/knative-eventing --for=condition=Ready --timeout=300s -n knative-eventing
