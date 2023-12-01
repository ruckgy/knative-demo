kubectl create configmap kafka-test --from-file test-broker.js -o yaml --dry-run=client | kubectl apply -f -
kubectl apply -f test-runner.yml
kubectl wait testrun/k6-kafka-test --for=condition=TestRunRunning=False --timeout=120s
kubectl delete -f test-runner.yml
