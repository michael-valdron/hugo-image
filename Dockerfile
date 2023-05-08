FROM docker.io/library/golang:1.19-alpine

RUN apk update && apk add hugo

CMD ["hugo"]
