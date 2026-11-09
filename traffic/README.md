# Traffic policies

All templates in this directory are opt-in, sample targets must be replaced before apply. Do not accidentally attach them to every Gateway route. Use application Helm `backendTrafficPolicy.spec` for route-level policies. Global rate limiting additionally needs Envoy Ratelimit Service + Redis and controller configuration.
