FROM golang:1.9-alpine
RUN apk update && apk add git
RUN go get github.com/cubicdaiya/slackboard/...
RUN go get gopkg.in/Netflix-Skunkworks/go-jira.v1/cmd/jira

FROM alpine:3.7
RUN apk add --no-cache ca-certificates
WORKDIR /root/
COPY --from=0 /go/bin/slackboard-cli .
COPY --from=0 /go/bin/jira .
