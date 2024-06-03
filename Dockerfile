FROM docker.io/library/golang:1.21-alpine@sha256:2a1959ca3c229c72fbbee9643b88ef23d7859a7d18b60a0d94ee3d2923b49316

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
