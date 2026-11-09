# GitOps multi-repo bootstrap

ApplicationSets `services-staging.yaml` and `services-production.yaml` discover `apps/*/<env>/app.yaml` in the app catalog, then deploy a shared Helm chart with values referenced via Argo CD multi-source `$values`.

Before rollout: update both remote Git URLs; ensure Argo CD supports multi-source Applications, configure Git credentials, pin immutable chart versions or Git SHAs rather than `main`, configure AppProject destinations, set Argo CD project RBAC and the Kubernetes RBAC of the application controller, and establish approvals for production. Treat `automated.prune: true` as potentially destructive; enable only with recovery process.

The `service.profile` label in app.yaml is descriptive only, not enforced. Implement admission/policy validation separately.
