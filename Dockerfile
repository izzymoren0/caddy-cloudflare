FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/Javex/caddy-fail2ban@main \
    --with github.com/caddyserver/transform-encoder \
    --with github.com/caddy-dns/ddnss \
    --with github.com/caddy-dns/cloudflare

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
