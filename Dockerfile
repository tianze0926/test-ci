FROM rust:alpine as builder

RUN cargo install --git https://github.com/ankitects/anki.git --tag 2.1.66 --root /app anki-sync-server
RUN apk add --no-cache tree
RUN tree -apugshD /app