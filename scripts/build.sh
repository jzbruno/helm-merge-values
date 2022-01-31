#!/usr/bin/env sh

version="0.5.0"

GOOS=darwin GOARCH=amd64 go build -ldflags "-s -w" -o bin/helm-merge-values-${version}-darwin-amd64
GOOS=darwin GOARCH=arm64 go build -ldflags "-s -w" -o bin/helm-merge-values-${version}-darwin-arm64
GOOS=linux GOARCH=amd64 go build -ldflags "-s -w" -o bin/helm-merge-values-${version}-linux-amd64
GOOS=linux GOARCH=arm64 go build -ldflags "-s -w" -o bin/helm-merge-values-${version}-linux-arm64
GOOS=windows GOARCH=amd64 go build -ldflags "-s -w" -o bin/helm-merge-values-${version}-windows-amd64
