ARG VARIANT=stable-slim
FROM docker.io/library/debian:$VARIANT

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install --no-install-recommends --assume-yes \
    hello \
    && apt-get clean && rm -fr /var/lib/apt/lists/*

CMD [ "hello" ]
