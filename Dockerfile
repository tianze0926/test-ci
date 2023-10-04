FROM rust:alpine as builder

# musl-dev: https://stackoverflow.com/a/16016792
RUN apk add --no-cache musl-dev protoc
RUN cargo install --git https://github.com/ankitects/anki.git --tag 2.1.66 --root /app anki-sync-server


FROM alpine

WORKDIR /app
COPY --from=builder /app/bin/anki-sync-server .
COPY init.sh .

ENV SYNC_BASE=/app/data
ENV SYNC_HOST=0.0.0.0
ENV SYNC_PORT=80

CMD ["/bin/sh", "/app/init.sh"]