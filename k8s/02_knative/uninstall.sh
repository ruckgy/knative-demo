cd $(dirname $0)
kubectl delete -f https://github.com/knative-extensions/eventing-kafka-broker/releases/download/knative-v1.12.1/eventing-kafka.yaml
kubectl delete KnativeEventing knative-eventing -n knative-eventing
kubectl delete -f https://github.com/knative/serving/releases/download/knative-v1.12.1/serving-default-domain.yaml
kubectl delete KnativeServing knative-serving -n knative-serving
kubectl delete -f https://github.com/knative/operator/releases/download/knative-v1.12.1/operator.yaml
