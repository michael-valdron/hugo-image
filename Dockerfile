FROM docker.io/library/golang:1.21-alpine@sha256:ed8ce6c22dd111631c062218989d17ab4b46b503cbe9a9cfce1517836e65298a

RUN apk update && apk add hugo git

RUN mkdir -p /project

WORKDIR /project

CMD ["hugo"]
