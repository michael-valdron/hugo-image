FROM docker.io/library/golang:1.21-alpine@sha256:6e1679c338905384b10a99f63aa6db874d2a46b3354936f881f54acd9f922b69

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
