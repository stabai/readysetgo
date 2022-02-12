#!/usr/bin/env bash
# This script updates Bazel dependencies for imports to Go code using Gazelle.
# Run this whenever you would normally run `go mod tidy`.

go mod tidy
bazel run //:gazelle-update-repos
bazel run //:gazelle
