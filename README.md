# Functions

Create reverse function
```shell
kn func create -l python -t cloudevents reverse
```

Build
```shell
kn func build --image dev.local/reverse:0.0.1
```

Run
```shell
kn func run
```

Deploy
```shell
func deploy --build=false --push=false
```

Test
```shell
curl -v -H'Content-type: application/cloudevents+json' \
    -d '{"data": "Foo",
         "id": "1",
         "source": "meetup-test",
         "type": "init",
         "specversion": "1.0"}' \
   http://reverse.default.127.0.0.1.sslip.io
```
