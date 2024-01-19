#!/usr/bin/env bash
sh ./03_triggermesh/uninstall.sh
sh ./02_knative/uninstall.sh
sh ./01_kafka-cluster/delete-kafka-cluster.sh
