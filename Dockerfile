FROM docker.io/library/golang:1.21-alpine@sha256:c0ea884eb6fbeff67789797cb565d87995a125d0adc0907e46c6566498fd3ce2

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
