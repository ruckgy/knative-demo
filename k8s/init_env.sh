#!/usr/bin/env bash
sh ./01_kafka-cluster/create-kafka-cluster.sh
sh ./02_knative/install.sh
sh ./03_triggermesh/install.sh


