#syntax=docker/dockerfile:1

#Build stage
FROM golang:1.26-alpine AS builder


WORKDIR /app

COPY go.mod ./

COPY . .

RUN go build -o server .

#Final image

FROM alpine:latest

LABEL org.opencontainers.image.title="Go Web Server" \
      org.opencontainers.image.description="A simple Go web server containerized with Docker" \
      org.opencontainers.image.authors="adhiambobrender2@gmail.com"
      

WORKDIR /app      

COPY --from=builder /app/server .
COPY --from=builder /app/banners ./banners
COPY --from=builder /app/static ./static
COPY --from=builder /app/template ./template

EXPOSE 8080

CMD ["./server"]