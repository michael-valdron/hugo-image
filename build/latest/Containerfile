FROM docker.io/library/golang:1.22-alpine@sha256:0e10390f5b5201601f4e7ab0b16a99c021fe2e3f1c483fb8c0fcfe51a289b8f0

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
