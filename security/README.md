# Platform security — opt-in building blocks

- Shared policies are scoped to a specific Gateway or route, not magical inheritance by `service.profile`.
- Service-level JWT/OIDC/CORS/etc is authored using `standard-backend` chart `securityPolicy.spec` and approved PRs.
- Credentials stored outside Git, using pre-provisioned Kubernetes Secrets.
- Dedicated Gateway examples for client mTLS in `mtls-gateway.example.yaml`. Local namespaces must be permitted by Gateway.allowedRoutes.
- Enforce hostname ownership and deny extension CRDs with admission + RBAC, not just guidelines.
