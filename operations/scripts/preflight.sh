#!/usr/bin/env bash
set -euo pipefail
for bin in helm kubectl python3; do command -v "$bin" >/dev/null || { echo "MISSING $bin" >&2; exit 1; }; done
for crd in gateways.gateway.networking.k8s.io httproutes.gateway.networking.k8s.io envoyproxies.gateway.envoyproxy.io backendtrafficpolicies.gateway.envoyproxy.io securitypolicies.gateway.envoyproxy.io clienttrafficpolicies.gateway.envoyproxy.io; do
 kubectl get crd "$crd" >/dev/null || { echo "MISSING CRD: $crd" >&2; exit 1; }
done
kubectl get gatewayclass
kubectl get gateways -A
