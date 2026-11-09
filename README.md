# platform-infrastructure — Envoy Gateway v1.9 production architecture baseline

This repo contains platform-owned, GitOps-managed Gateway infrastructure. It is an implementation starter, NOT a deployed platform. No production rollout is claimed. See `docs/PRODUCTION-GATES.md`.

## Namespaces and ownership
- `infra-gateway`: GatewayClass, Gateways, EnvoyProxy, TLS listeners, platform policies.
- `argocd`: AppProjects + ApplicationSets, controlled by Platform.
- App namespaces: app team can manage Deployments/Services/HTTPRoutes, **not** cluster-scoped GatewayClass/Gateway/EnvoyProxy or extension CRDs.

## Components
- `gateway/base`: HTTP-only bootstrap. Not suitable for external production exposure without TLS/LB.
- `gateway/tls`: cert-manager production-ready integration pattern, requires cluster issuer and DNS setup.
- `traffic/`, `security/`: isolated optional policy profiles, never auto-applied globally.
- `ratelimit/`: global rate-limit Redis setup and controller config example (explicit opt-in).
- `observability/`: reference OpenTelemetry collector, scrape/alerts, integration map.
- `governance/`: RBAC and CI guardrails, forbidden EnvoyPatchPolicy and extension APIs.
- `argocd/`: an app catalog driven by Git generator and chart revision pinning.

## Bootstrap
1. Kubernetes cluster, networking, VIP/L4 LB, DNS, cert-manager and StorageClass prepared by operator.
2. Install Gateway API CRDs + Envoy Gateway v1.9 pinned via Helm using controlled change management.
3. Apply namespace/gateway base with Kustomize after reviewing addresses, resource sizes, RBAC and routes.
4. Deploy observability and secrets integration. Verify Proxy metric endpoints.
5. Install Argo CD; configure credentials and environment-specific ApplicationSets, grant least privileges.
6. Verify a service through Git-only onboarding, route resolution, rollback and disaster recovery.

Never apply all policy examples blindly; profiles require target adjustment and service-specific review.
