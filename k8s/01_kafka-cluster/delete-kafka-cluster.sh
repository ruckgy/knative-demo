cd $(dirname $0)
kubectl delete -f kafka-topic.yml -n kafka
kubectl delete -f https://raw.githubusercontent.com/strimzi/strimzi-kafka-operator/main/examples/kafka/nodepools/kafka-with-kraft-ephemeral.yaml -n kafka
kubectl delete -f 'https://strimzi.io/install/latest?namespace=kafka' -n kafka
kubectl delete namespace kafka






