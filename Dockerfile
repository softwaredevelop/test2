FROM python:alpine

LABEL docker-run-flags="-d \
    --restart always \
    -p 5050:5050 \
    -v /etc/localtime:/etc/localtime:ro \
    -v /volumes/couchpotato:/data \
    --link transmission:transmission \
    --name couchpotato"

RUN apk add --no-cache \
    ca-certificates=~20211220-r0 \
    && rm -rf /var/lib/apt/lists/*

ENV COUCHPOTATO_VERSION master

WORKDIR /usr/src/couchpotato

RUN git clone https://github.com/RuudBurger/CouchPotatoServer.git /usr/src/couchpotato \
    && git checkout "${COUCHPOTATO_VERSION}"

ENTRYPOINT [ "python", "CouchPotato.py", "--debug" ]
CMD [ "--data_dir", "/data" ]
