FROM golang:1.13.15-alpine as builder

RUN apk add --no-cache git gcc libc-dev
RUN go get github.com/Kong/go-pluginserver

RUN mkdir /go-plugins

# plugin hello
COPY ./go-plugins/hello/* /go-plugins/hello/
RUN go build -o /go-plugins/hello/hello /go-plugins/hello/hello.go

FROM kong:2.3.2-alpine

USER kong

COPY --from=builder /go-plugins/hello/hello /usr/local/bin/hello
