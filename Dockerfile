FROM docker.io/library/golang:1.19-alpine

RUN apk update && apk add hugo git

RUN mkdir -p /project

WORKDIR /project

CMD ["hugo"]
