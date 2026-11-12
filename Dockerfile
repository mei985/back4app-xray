FROM teddysun/xray:latest AS builder
FROM alpine:latest
RUN apk add --no-cache ca-certificates
COPY --from=builder /usr/bin/xray /usr/bin/xray
COPY config.json /etc/xray/config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 3000
ENTRYPOINT ["/entrypoint.sh"]
