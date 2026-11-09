# Grafana dashboards

Provision Envoy Gateway official v1.9 dashboards from the version-pinned addons Helm chart. Do not assume raw Envoy metric names remain unchanged between releases. Mandatory panels: RPS by route, downstream 4xx/5xx, upstream 5xx, p95/p99 (when histogram available), CPU/memory/throttling, xDS configuration updates, rate-limit denies, retries, breaker overflow, certificate expiry. Configure alerting and SLO in the existing metrics platform.
