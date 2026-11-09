# Operations runbooks

| Operation | Approach |
|---|---|
| New service | PR `service-deployments` -> AppSet -> Helm -> Deployment/Service/HTTPRoute -> Envoy xDS |
| Canary / rollback | update Git route weights or image tag; observe SLO; revert PR |
| Update Gateway | change platform-infrastructure via reviewed PR; check data plane rolling update |
| Scale | resource budgets, Envoy Proxy replicas and HPA with workload-specific metrics; test on staging |
| Diagnose | `kubectl get gateway,httproute -A`; check Accepted/ResolvedRefs/Programmed and Controller logs; `egctl` |
| Air gap | mirror controller, sidecar, proxies and app images to private registry + pinned Helm artifacts |
| Disaster recovery | restore Git, Secrets and dependencies; avoid assuming Git alone recovers TLS/Redis/identity |

## CI checks

1. Helm lint/template + JSON Schema values validation.
2. YAML parse + forbidden resource kind guard.
3. Server-side dry run against cluster with pinned CRDs.
4. Ownership enforcement: namespace, hostname, allowed route attachment, RBAC.
5. Synthetic canary/smoke tests, alerts, rollback drill.
