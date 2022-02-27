#!/usr/bin/env bash
# This script updates Bazel dependencies for imports to Go code using Gazelle.
# Run this whenever you would normally run `go mod tidy`, or update protos.

# If running via Bazel, execute from workspace root instead of execroot.
if [[ "$BUILD_WORKSPACE_DIRECTORY" != "" ]]; then
  cd "$BUILD_WORKSPACE_DIRECTORY" || exit 1
fi

# If not in workspace root, error out. Will not happen when run via Bazel.
if [[ ! -f "WORKSPACE" ]]; then
  echo "$(tput setaf 1)Error:$(tput sgr0) Must run from workspace root."
  exit 1
fi

buf generate
go mod tidy
bazel run //:gazelle-update-repos
bazel run //:gazelle
