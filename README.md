# readysetgo

Starter template for a monorepo for Go microservices using gRPC, Bazel, and Tilt

![License](https://img.shields.io/github/license/stabai/readysetgo?label=License)
![Last Commit](https://img.shields.io/github/last-commit/stabai/readysetgo?label=Last%20Commit)

![Build System](https://img.shields.io/badge/Build%20System-Bazel-43a047)
![Service Transport](https://img.shields.io/badge/Service%20Transport-gRPC-244c5a)
![Go Version](https://img.shields.io/github/go-mod/go-version/stabai/readysetgo/main?label=Go%20Version)

[![Build](https://github.com/stabai/readysetgo/actions/workflows/build.yml/badge.svg)](https://github.com/stabai/readysetgo/actions/workflows/build.yml)
[![Test](https://github.com/stabai/readysetgo/actions/workflows/test.yml/badge.svg)](https://github.com/stabai/readysetgo/actions/workflows/test.yml)
[![Lint](https://github.com/stabai/readysetgo/actions/workflows/lint.yml/badge.svg)](https://github.com/stabai/readysetgo/actions/workflows/lint.yml)
[![Tilt](https://github.com/stabai/readysetgo/actions/workflows/tilt.yml/badge.svg)](https://github.com/stabai/readysetgo/actions/workflows/tilt.yml)
[![Buildifier](https://github.com/stabai/readysetgo/actions/workflows/buildifier.yml/badge.svg)](https://github.com/stabai/readysetgo/actions/workflows/buildifier.yml)

## Prerequisites

### Nix (recommended)

If you want to use Nix, all you *need* to do is
[install Nix](https://nixos.org/download.html). Then, just run `nix-shell` from
the repository root to get a fully-configured shell.

However, some of your tools (e.g. IDE) might behave better if you also install
things locally using the directions below.

### Homebrew

If you're using macOS or Linux, you can install all required tools easily using
the [Homebrew](https://brew.sh/) bundle defined in [`Brewfile`](Brewfile):

```shell
brew bundle install
```

Note: Even if you're using Windows, you should probably use the
[Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/about)
and just run everything on a Linux terminal.

### Manual

If for any reason you need to install them manually, this table contains all of
the required tools:

| Tool                                                                                 | Install instructions                                                                            |
| ------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------- |
| [Bazelisk](https://github.com/bazelbuild/bazelisk)                                   | [instructions](https://docs.bazel.build/versions/main/install-bazelisk.html)                    |
| [Tilt](https://tilt.dev)                                                             | [instructions](https://docs.tilt.dev/install.html)                                              |
| [Kubernetes CLI (`kubectl`)](https://kubernetes.io/docs/reference/kubectl/overview/) | [instructions](https://kubernetes.io/docs/tasks/tools/#kubectl)                                 |
| [Docker](https://www.docker.com)                                                     | [instructions](https://docs.docker.com/get-docker/)                                             |
| [minikube](https://minikube.sigs.k8s.io)                                             | [instructions](https://minikube.sigs.k8s.io/docs/)                                              |
| [grpc_cli](https://github.com/grpc/grpc/blob/master/doc/command_line_tool.md)        | [instructions](https://github.com/grpc/grpc/blob/master/doc/command_line_tool.md#code-location) |
| [buildifier](https://github.com/bazelbuild/buildtools/tree/master/buildifier)        | [instructions](https://github.com/bazelbuild/buildtools/tree/master/buildifier#setup)           |

## Running the environment with Tilt

If you haven't already, start up a Kubernetes cluster:

```shell
minikube start
```

Then, run this and follow terminal instructions to load the Tilt console:

```shell
tilt up
```

## Running servers individually

### gRPC Server

```shell
bazel run src/example/service:server
```

### HTTP Server

```shell
bazel run src/example/web/server
```

## Testing the gRPC Server

`grpc_cli` is an easy way to issue requests to the gRPC server:

```shell
grpc_cli call localhost:50051 ExampleService/GetExample "id: 'foo'"
grpc_cli call localhost:50051 ExampleService/SetExample "id: 'foo', data: {text: 'bar'}"
grpc_cli call localhost:50051 ExampleService/GetExample "id: 'foo'"
```

## To-do list for this repository

Near term tasks:

- Add Buf to CI
- Add code quality scan to CI
- Add code coverage to CI
- Add Gazelle to CI
- Add PR comments for CI errors wherever possible
- Add git hooks and repository setup script
- Generify HTTP server
- Add documentation for CI

Potential future projects:

- Add [service resource dependencies](https://docs.tilt.dev/resource_dependencies.html) to Tilt environment
- Add project configuration/generator/wizard so people don't get features they don't want
- Add TypeScript React app to example HTTP server
- Add support for other backend languages
- Add Deno scripts to simplify custom workflows
- Add production deployment examples
- Add database to environment
- Add ORM to any example server
- Add pubsub to any example server
- Add cache to any example server
- Add GraphQL to environment
- Add authentication to generic server
- Add authorization to generic server
- Add auditing to generic server
- Add monitoring to generic server
- Add distributed tracing to generic server
- Add dynamic config delivery (e.g. [Protoconf](https://github.com/protoconf/protoconf)) to generic server
- Add API simulation tests
- Add end-to-end tests
- Add new service setup wizard
