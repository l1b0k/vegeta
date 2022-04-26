FROM golang:1.18.1 as build
WORKDIR /go/src/github.com/tsenart/vegeta/
COPY . .
RUN go build .


FROM ubuntu:20.04
COPY --from=build /go/src/github.com/tsenart/vegeta/vegeta /usr/bin/
ENTRYPOINT ["/usr/bin/vegeta"]