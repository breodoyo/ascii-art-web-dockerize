#syntax=docker/dockerfile:1

#Build stage
FROM golang:1.24-alpine AS builder
LABEL org.opencontainers.image.title="Go Web Server" \
      org.opencontainers.image.description="A simple Go web server containerized with Docker"
      org.opencontainers.image.authors="adhiambobrender2@gmail.com"

WORKDIR / app

COPY go.mod go.sum
RUN go mod download

COPY . .

RUN go build -o /app/webserver

#Final image
FROM alpine:3.21
LABEL org.opencontainers.image.title="Go Web Server" \
      org.opencontainers.image.description="A simple Go web server containerized with Docker"
      org.opencontainers.image.authors="adhiambobrender2@gmail.com"

COPY --from=builder /app/webserver /webserver

EXPOSE 8080

CMD ["/webserver"]