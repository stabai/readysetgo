#!/usr/bin/env bash

go mod tidy
bazel run //:gazelle-update-repos
bazel run //:gazelle
