# Global rate limiting — optional

1. Install Redis with HA and network isolation (the sample here is *single-instance dev-only*).
2. Configure EnvoyGateway controller `rateLimit.backend` to point to the Redis DNS; make a Helm upgrade with pinned 1.9 chart.
3. Check rate limit service Ready, then create BackendTrafficPolicy with `rateLimit.global`.
4. Verify all Envoy Proxy replicas share quota. No assumption that `local` limits are shared.
