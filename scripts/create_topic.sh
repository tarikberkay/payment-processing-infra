#!/bin/bash
NAMESPACE=payments-namespace
POD=$(kubectl get pod -n $NAMESPACE -l strimzi.io/name=payments-kafka -o jsonpath="{.items[0].metadata.name}")
kubectl exec -n $NAMESPACE $POD -- \
  kafka-topics.sh --create \
    --topic payment-events \
    --partitions 5 \
    --replication-factor 2 \
    --bootstrap-server payments-kafka:9092
