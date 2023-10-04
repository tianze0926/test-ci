FROM rust:alpine as builder

# https://stackoverflow.com/a/16016792
RUN apk add --no-cache musl-dev
RUN cargo install --git https://github.com/ankitects/anki.git --tag 2.1.66 --root /app anki-sync-server
RUN apk add --no-cache tree
RUN tree -apugshD /app