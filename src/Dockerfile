FROM golang:1.11 as builder
WORKDIR /go/src/github.com/perylemke/apery/
COPY server.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o apery .
# RUN go build -ldflags "-s -w" -o server server.go

FROM alpine:3.6
RUN apk add --no-cache ca-certificates
WORKDIR /apery/
COPY --from=builder /go/src/github.com/perylemke/apery/apery .
CMD ["./apery"]