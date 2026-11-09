# Production readiness gates

This package is a **design + deployable templating baseline**. It has not been deployed into the user's cluster. No production readiness claim is made.

Mandatory before real production: TLS, public/internal L4 LB/VIPs, Gateway exposure, cert-manager/External Secrets + CA rotation, Redis HA, CRD compatibility, Gateway API experimental channel where required, workload quota/NetworkPolicy, observability scrape/metrics labels, ApplicationSet repository credentials, strict RBAC and namespace isolation, hostname ownership admission, disaster recovery, SLO and canary rollback, environment-specific performance tests, supply-chain image signing/scanning.

Do not apply optional `examples/` or `security/` manifests in bulk. Copy and adapt only the selected policy to an owned target (Gateway/Route), run `kubectl apply --dry-run=server` and check Accepted/Programmed/ResolvedRefs.

Hard-deny (policy): EnvoyPatchPolicy, EnvoyExtensionPolicy, custom Lua/Wasm/ext_proc/dynamic modules. CRDs may be installed by Envoy Gateway but app teams must not create instances. Kyverno admission example is optional and requires Kyverno already installed and enforcement tested.

Potential gaps which cannot be solved with YAML alone: geoIP database, external IdP, extAuthZ server, remote external services, multi-cluster ServiceImport controller, DNS/cert issuance, backend TLS PKI, HTTP3 UDP/LB routing, gateway deployment mode/upgrade strategy, air-gapped mirrored registry, third-party OTel/HyperDX endpoint.
