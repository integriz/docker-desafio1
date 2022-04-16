FROM golang:latest AS builder
COPY codeeducation.go /go/src
WORKDIR /go/src
RUN go build codeeducation.go  

FROM hello-world
WORKDIR /home
COPY --from=builder /go/src .
ENTRYPOINT [ "./codeeducation" ]

