FROM --platform=${BUILDPLATFORM} golang:1.23 AS builder
WORKDIR $GOPATH/src/github.com/plotly/oomie
COPY . $GOPATH/src/github.com/plotly/oomie
ARG TARGETOS=linux
ARG TARGETARCH=amd64
RUN GOOS=$TARGETOS GOARCH=$TARGETARCH make build

FROM gcr.io/distroless/static-debian12
COPY --from=builder /go/src/github.com/plotly/oomie/bin/oomie /oomie
ENTRYPOINT ["/oomie"]
