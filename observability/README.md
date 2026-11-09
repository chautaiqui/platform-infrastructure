# Observability pipeline

Envoy Gateway Controller + data-plane Proxy expose Prometheus metrics. Use ServiceMonitor/PodMonitor with matching chart labels and verified target ports; the examples here are **not auto-installed**, because existing Helm chart creates dynamic service labels. Keep low-cardinality route/gateway metrics; do not label metrics with UID/request_id. For traces/logs use OpenTelemetry Collector; replace receivers/exporter auth and TLS with managed secrets and endpoints.

Recommended: `Prometheus + Grafana` for metrics and alerts, `OTel Collector -> ClickHouse/HyperDX` for traces/logs, correlation by trace ID and gateway/route labels.
