cd $(dirname $0)
kubectl create namespace kafka
kubectl create -f 'https://strimzi.io/install/latest?namespace=kafka' -n kafka
kubectl wait deployment/strimzi-cluster-operator --for=condition=Available --timeout=300s -n kafka
kubectl set env deployment/strimzi-cluster-operator STRIMZI_FEATURE_GATES="+UseKRaft,+KafkaNodePools" -n kafka

kubectl apply -f https://raw.githubusercontent.com/strimzi/strimzi-kafka-operator/main/examples/kafka/nodepools/kafka-with-kraft-ephemeral.yaml -n kafka
kubectl wait kafka/my-cluster --for=condition=Ready --timeout=300s -n kafka
kubectl apply -f kafka-topic.yml -n kafka
