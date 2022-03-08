# readysetgo

Starter template for a monorepo for Go microservices using gRPC, Bazel, and Tilt

![License](https://img.shields.io/github/license/stabai/readysetgo?label=License)
![Last Commit](https://img.shields.io/github/last-commit/stabai/readysetgo?label=Last%20Commit)

![Build System](https://img.shields.io/badge/Build%20System-Bazel-43a047)
![Service Transport](https://img.shields.io/badge/Service%20Transport-gRPC-244c5a)
![Go Version](https://img.shields.io/github/go-mod/go-version/stabai/readysetgo/main?label=Go%20Version)

[![Build](https://github.com/stabai/readysetgo/actions/workflows/build.yml/badge.svg)](https://github.com/stabai/readysetgo/actions/workflows/build.yml)
[![Test](https://github.com/stabai/readysetgo/actions/workflows/test.yml/badge.svg)](https://github.com/stabai/readysetgo/actions/workflows/test.yml)
[![Buf](https://github.com/stabai/readysetgo/actions/workflows/buf.yml/badge.svg)](https://github.com/stabai/readysetgo/actions/workflows/buf.yml)
[![Lint](https://github.com/stabai/readysetgo/actions/workflows/lint.yml/badge.svg)](https://github.com/stabai/readysetgo/actions/workflows/lint.yml)
[![Tilt](https://github.com/stabai/readysetgo/actions/workflows/tilt.yml/badge.svg)](https://github.com/stabai/readysetgo/actions/workflows/tilt.yml)
[![Buildifier](https://github.com/stabai/readysetgo/actions/workflows/buildifier.yml/badge.svg)](https://github.com/stabai/readysetgo/actions/workflows/buildifier.yml)

## Prerequisites

### Nix (recommended)

If you want to use Nix, all you _need_ to do is
[install Nix](https://nixos.org/download.html). Then, just run `nix-shell` from
the repository root to get a fully-configured shell.

However, some of your tools (e.g. IDE) might behave better if you also install
things locally using the directions below.

### Homebrew (also recommended)

If you're using macOS or Linux, you can install all required tools easily using
the [Homebrew](https://brew.sh/) bundle defined in [`Brewfile`](Brewfile):

```shell
brew bundle install
```

### Windows

Even if you're using Windows, you should probably use the
[Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/about)
wherever possible.

Some of the tools can also be installed on your Windows instance to allow IDE
integration. The easiest way to do this is to use
[Chocolatey](https://chocolatey.org/):

```shell
choco install go bazelisk buildifier protoc
```

### Manual

If for any reason you need to install them manually, this table contains all of
the required tools:

| Tool                                                                                 | Install instructions                                                                            |
| ------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------- |
| [Bazelisk](https://github.com/bazelbuild/bazelisk)                                   | [instructions](https://docs.bazel.build/versions/main/install-bazelisk.html)                    |
| [Buf](https://buf.build)                                                             | [instructions](https://docs.buf.build/installation)                                             |
| [Tilt](https://tilt.dev)                                                             | [instructions](https://docs.tilt.dev/install.html)                                              |
| [Kubernetes CLI (`kubectl`)](https://kubernetes.io/docs/reference/kubectl/overview/) | [instructions](https://kubernetes.io/docs/tasks/tools/#kubectl)                                 |
| [Docker](https://www.docker.com)                                                     | [instructions](https://docs.docker.com/get-docker/)                                             |
| [minikube](https://minikube.sigs.k8s.io)                                             | [instructions](https://minikube.sigs.k8s.io/docs/)                                              |
| [grpc_cli](https://github.com/grpc/grpc/blob/master/doc/command_line_tool.md)        | [instructions](https://github.com/grpc/grpc/blob/master/doc/command_line_tool.md#code-location) |
| [buildifier](https://github.com/bazelbuild/buildtools/tree/master/buildifier)        | [instructions](https://github.com/bazelbuild/buildtools/tree/master/buildifier#setup)           |

## Initializing Your Repository

Run the [tidy.sh](tidy.sh) script to initialize your repository after cloning
and installing prerequisites:

```shell
bazel run //:tidy
```

You should also run this script after doing any of the following:

- Modifying protobuf files
- Adding/remove dependencies to Go code

## Running the Environment with Tilt

If you haven't already, start up a Kubernetes cluster:

```shell
minikube start
```

Then, run Tilt and follow the instructions in the terminal to open the web
console:

```shell
tilt up
```

## Running Servers Individually

### gRPC Server

```shell
bazel run //src/example/service:server
```

### HTTP Server

```shell
bazel run //src/example/web/server
```

## Testing the gRPC Server

`grpc_cli` is an easy way to issue requests to the gRPC server:

```shell
grpc_cli call localhost:50051 ExampleService/GetExample "id: 'foo'"
grpc_cli call localhost:50051 ExampleService/SetExample "id: 'foo', data: {text: 'bar'}"
grpc_cli call localhost:50051 ExampleService/GetExample "id: 'foo'"
```

## To-do List for this Repository

### Near Term Tasks

- Add code quality scan to CI
- Add code coverage to CI
- Add Gazelle to CI
- Add PR comments for CI errors wherever possible
- Add git hooks and repository setup script
- Generify HTTP server
- Add documentation for CI
- Add database to environment
- Add ORM to any example server

### Potential Future Projects

- Add
  [service resource dependencies](https://docs.tilt.dev/resource_dependencies.html)
  to Tilt environment
- Add project configuration/generator/wizard so people don't get features they
  don't want
- Add TypeScript React app to example HTTP server
- Add support for other backend languages
- Add Deno scripts to simplify custom workflows
- Add production deployment examples
- Add dynamic configs to environment
- Add pubsub to any example server
- Add cache to any example server
- Add authentication to generic server
- Add authorization to generic server
- Add auditing to generic server
- Add monitoring to generic server
- Add distributed tracing to generic server
- Add single-server integration tests
- Add multi-server API simulation tests
- Add multi-server end-to-end tests
- Add new service setup wizard

## Philosophy

The goal of this template is to provide something that you can use to instantly
create a production-worthy enterprise microservice environment. The environment
aims to be opinionated about:

- Core dependencies (e.g. Bazel, Protocol Buffers)
- Practices
- Abstractions (e.g. good API definitions, service isolation/composition).

However, these pieces should be able to plug into any particular technologies
(e.g. PostgreSQL, Okta, Kong) desired, and this template should remain strictly
neutral on those opinions. Providing plugins/helpers to make certain
integrations easier does not mean assuming that technology will be used.

The assumptions we make about the target environment are:

- It will use Bazel for builds (could support others in the future)
- It will contain services written in Go (could support others in the future)
- It will use Protocol Buffers for service descriptors (could support others in
  the future)
- It will use gRPC and/or HTTP for transport
- It will run in Kubernetes
- It will use Tilt to manage local development environments

### Shared Plugins vs Template Plugins

Currently, most of the custom work in this environment is contained within this
repo. That means that you won't get any future updates made, but it also means
you can customize things to your heart's desire.

The eventual goal is to strike a good balance on this, allowing both models
easily. It's quite possible that those shared mechanisms will be removed from
this repository and used as shared resources in the future, similarly to how we
use existing tools like Gazelle.

### Servers != Services

There are two fundamentally different things that people might mean when they
say these words, so it's important to be clear. When this environment discusses
these terms, they have these definitions:

- **Service:** An API with defined methods that take certain inputs and produce
  outputs
- **Server:** A long-running application that provides service(s) over a network
  interface

These should be decoupled as much as possible. The size of your thread pool
(server) may be related to the kind of data processing in your business logic
(service), but they are still separate concerns that are often managed by
separate people.
