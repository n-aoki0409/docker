FROM golang:1.20.2-alpine3.16 as builder

ENV CGO_ENABLED 1

RUN apk add alpine-sdk 
RUN apk --update add git

ADD . /work
WORKDIR /work

RUN	go build -tags musl -o consumer ./cmd/consumer/main.go && \
	go build -tags musl -o producer ./cmd/producer/main.go
