#!/usr/bin/env bash
set -euo pipefail
kubectl get nodes -o wide
kubectl get gatewayclass
kubectl get gateway -A
kubectl get httproute,grpcroute,tcproute,udproute,tlsroute -A 2>/dev/null || true
kubectl get backendtrafficpolicy,securitypolicy,clienttrafficpolicy -A 2>/dev/null || true
kubectl get deploy,pods,svc -n envoy-gateway-system -o wide
kubectl get pods -A | grep -E 'CrashLoopBackOff|ImagePullBackOff|Error' && exit 1 || true
