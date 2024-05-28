FROM docker.io/library/golang:1.21-alpine@sha256:38c675b4f586865b79c996511acd84af64dbe47b71d2f5cb2da55ff3dac54fc6

RUN apk update && apk add hugo git

RUN mkdir -p /project

WORKDIR /project

ARG BUILD_DATE

# Labels
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=${BUILD_DATE}
LABEL org.label-schema.name="michaelvaldron/hugo"
LABEL org.label-schema.description="A container image for using the Hugo CLI command"

CMD ["hugo"]
