mvn clean install -DskipTests
docker build -t dev.local/demo-func-reverse:kind --progress=tty .
kind load docker-image dev.local/demo-func-reverse:kind --name knative
kn service update demo-func-reverse \
  --concurrency-target=1 \
  --image=dev.local/demo-func-reverse:kind -n demo

#us-central1-docker.pkg.dev/knative-demo-403112/demo-registry
#us-central1-docker.pkg.dev/knative-demo-403112/demo-registry/demo-func-reverse:kind
kn service create demo-func-reverse \
  --concurrency-target=1 \
  --image=us-central1-docker.pkg.dev/knative-demo-403112/demo-registry/demo-func-reverse:kind -n demo

us-east4-docker.pkg.dev/cision-container-registry/container-artifact-registry/demo-func-reverse:kind



kn service create demo-func-reverse \
  --concurrency-target=1 \
  --image=docker.io/library/demo:0.0.1-SNAPSHOT -n demo
