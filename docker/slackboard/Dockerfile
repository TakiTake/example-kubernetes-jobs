FROM golang:1.9-alpine
RUN apk update && apk add git
RUN go get github.com/cubicdaiya/slackboard/...

FROM alpine:3.7
WORKDIR /root/
COPY --from=0 /go/bin/slackboard .
CMD ["./slackboard"]
