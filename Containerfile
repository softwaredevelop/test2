ARG VARIANT=stable-slim
FROM docker.io/library/debian:$VARIANT

ENV DEBIAN_FRONTEND=noninteractive
