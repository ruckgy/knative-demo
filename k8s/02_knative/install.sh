cd $(dirname $0)
kubectl apply -f https://github.com/knative/operator/releases/download/knative-v1.12.1/operator.yaml
kubectl wait deployment/knative-operator --for=condition=Available --timeout=300s
kubectl apply -f serving.yml
kubectl wait KnativeServing/knative-serving --for=condition=Ready --timeout=300s -n knative-serving
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.12.1/serving-default-domain.yaml
kubectl apply -f eventing.yml
kubectl wait KnativeEventing/knative-eventing --for=condition=Ready --timeout=300s -n knative-eventing
kubectl apply -f https://github.com/knative-extensions/eventing-kafka-broker/releases/download/knative-v1.12.1/eventing-kafka.yaml
kubectl wait deployments/kafka-broker-dispatcher --for=condition=Available --timeout=300s -n knative-eventing
kubectl wait deployments/kafka-broker-receiver --for=condition=Available --timeout=300s -n knative-eventing
kubectl wait deployments/kafka-channel-dispatcher --for=condition=Available --timeout=300s -n knative-eventing
kubectl wait deployments/kafka-controller --for=condition=Available --timeout=300s -n knative-eventing
kubectl wait deployments/kafka-sink-receiver --for=condition=Available --timeout=300s -n knative-eventing
kubectl wait deployments/kafka-webhook-eventing --for=condition=Available --timeout=300s -n knative-eventing

