# TLS: opt-in

`https-gateway.yaml` is a reference for a **dedicated** Gateway. Create `infra-gateway/public-tls` secret via cert-manager or external secret first, then apply. Never place private keys in Git. Do not mutate existing lab Gateway. Configure external LB for port 443.
