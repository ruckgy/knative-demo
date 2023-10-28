#!/usr/bin/env bash

. ./scripts/run_app.sh
$CMD &

export PID=$!
sleep 5
echo $PID

curl --location --request POST 'http://localhost:8080' --header 'Content-Type: application/json' --data-raw 'test' -s > /dev/null
sleep 3

echo "======================================"
echo "Capturing metrics for $PID PID"
echo "======================================"
psrecord $PID --plot "$1.png" --include-children &

echo "======================================"
echo "Firing $2 requests against the app"
echo "======================================"
#hey -n $2 -m POST -T "text/plain" -d "test" http://localhost:8080/test
#wrk -d 30s -s scripts/wrk_post.lua --latency http://localhost:8080/test
k6 run -i $2 -u $3 scripts/k6_load_test.js

kill $PID
sleep 1
