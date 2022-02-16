# readysetgo

Starter template for a monorepo for Go microservices using gRPC, Bazel, and Tilt

## Prerequisites

You need the following tools installed to use this environment:

| Tool                                                                                 | Homebrew formula    | Manual install                                                                                    |
|--------------------------------------------------------------------------------------|---------------------|---------------------------------------------------------------------------------------------------|
| [Bazelisk](https://github.com/bazelbuild/bazelisk)                                   | `bazelisk`          | [manual install](https://docs.bazel.build/versions/main/install-bazelisk.html)                    |
| [Tilt](https://tilt.dev)                                                             | `tilt-dev/tap/tilt` | [manual install](https://docs.tilt.dev/install.html)                                              |
| [Kubernetes CLI (`kubectl`)](https://kubernetes.io/docs/reference/kubectl/overview/) | `kubernetes-cli`    | [manual install](https://kubernetes.io/docs/tasks/tools/#kubectl)                                 |
| [Docker](https://www.docker.com)                                                     | `docker`            | [manual install](https://docs.docker.com/get-docker/)                                             |
| [minikube](https://minikube.sigs.k8s.io)                                             | `minikube`          | [manual install](https://minikube.sigs.k8s.io/docs/)                                              |
| [grpc_cli](https://github.com/grpc/grpc/blob/master/doc/command_line_tool.md)        | `grpc`              | [manual install](https://github.com/grpc/grpc/blob/master/doc/command_line_tool.md#code-location) |
| [buildifier](https://github.com/bazelbuild/buildtools/tree/master/buildifier)        | `buildifier`        | [manual install](https://github.com/bazelbuild/buildtools/tree/master/buildifier#setup)           |

If you're using MacOS or Linux, you can install these easily using [Homebrew](https://brew.sh/):

```shell
brew install bazelisk tilt-dev/tap/tilt kubernetes-cli docker minikube grpc buildifier
```

If you're using Windows, you should probably use the [Windows Subsystem for
Linux](https://docs.microsoft.com/en-us/windows/wsl/about) and just run things
on the Linux terminal.

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
bazel run src/example/service
```

## Testing the gRPC Server

`grpc_cli` is an easy way to issue requests to the gRPC server:

```shell
grpc_cli call localhost:50051 ExampleService/GetExample "id: 'foo'"
grpc_cli call localhost:50051 ExampleService/SetExample "id: 'foo', data: {text: 'bar'}"
grpc_cli call localhost:50051 ExampleService/GetExample "id: 'foo'"
```

## To-Do list for this repo

Near term tasks:

* Add tests for servers
* Add Bazel build cache to CI
* Add Buf to CI
* Add code quality scan to CI
* Add code coverage to CI
* Add Gazelle to CI
* Add PR comments for CI errors wherever possible
* Add git hooks and repo setup script
* Add Homebrew bundle
* Add auto build/test of targets affected by changes
* Generify gRPC server
* Generify HTTP server

Potential future projects:

* Add service metadata to Bazel to allow dynamic creation of Tilt environments
* Add TypeScript React app to example HTTP server
* Add support for other backend languages
* Add Deno scripts to simplify custom workflows
* Add production deployment examples
* Add database to environment
* Add ORM to any example server
* Add pubsub to any example server
* Add cache to any example server
* Add GraphQL to environment
* Add authentication to generic server
* Add authorization to generic server
* Add auditing to generic server
* Add monitoring to generic server
* Add distributed tracing to generic server
* Add API simulation tests
* Add end-to-end tests
* Add new service setup wizard
