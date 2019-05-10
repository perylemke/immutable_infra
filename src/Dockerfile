FROM golang:1.11 as builder
WORKDIR /go/src/github.com/perylemke/apery/
COPY apery.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o apery .

FROM scratch
WORKDIR /apery/
COPY --from=builder /go/src/github.com/perylemke/apery/apery .
CMD ["./apery"]