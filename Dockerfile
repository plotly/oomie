FROM --platform=${BUILDPLATFORM} golang:1.23 AS builder
WORKDIR $GOPATH/src/github.com/plotly/oomie
COPY . $GOPATH/src/github.com/plotly/oomie
ARG TARGETOS=linux
ARG TARGETARCH=amd64
RUN GOOS=$TARGETOS GOARCH=$TARGETARCH make build

# CVE-2026-114406: Debian 13 distroless, built after the ca-certificates fix that drops
# emSign ECC Root CA - G3 and Comodo AAA. The debian12 image still trusts both.
FROM gcr.io/distroless/static-debian13@sha256:448810357cc8e67b7208988abdba0f5ec3d3aebee0a5b13eb624979792cffc0f
COPY --from=builder /go/src/github.com/plotly/oomie/bin/oomie /oomie
ENTRYPOINT ["/oomie"]
