# Guardrails

App namespace RBAC prevents editing cluster-scoped GatewayClass/Gateway and EnvoyProxy. Kyverno optional admission blocks EnvoyPatchPolicy + EnvoyExtensionPolicy globally. Also configure host ownership admission: `allowedRoutes` controls namespaces but not ownership of hostname/path; a conflicting HTTPRoute can still be created. No automatic deployment of Kyverno examples without review.
