# Service profiles (contract; mockup)
Profiles `public-api`, `internal-api`, `partner-api`, `admin-api` are platform conventions, **not Envoy Gateway native CRDs**.
A policy generator or chart must explicitly translate profile names to supported Envoy Gateway v1.9 resources.
Do not assume Gateway-level and HTTPRoute-level policies merge. Validate precedence, targetRefs and conflicts.
For production: hostname ownership enforcement, namespace RBAC, policy admission, allowlists, threat modeling, and reviewed exceptions.
