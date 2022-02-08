
ARG VARIANT=stable-slim
FROM docker.io/library/debian:$VARIANT

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install --no-install-recommends --assume-yes \
    apt-utils=2.2.4 \
    hello=2.10-2 \
    && apt-get clean && rm -fr /var/lib/apt/lists/*

EXPOSE 5050

CMD [ "hello" ]
