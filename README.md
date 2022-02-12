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

If you're using MacOS or Linux, you can install these easily using [Homebrew](https://brew.sh/):

```shell
brew install bazelisk tilt-dev/tap/tilt kubernetes-cli docker minikube grpc
```

If you're using Windows, you should probably use the [Windows Subsystem for
Linux](https://docs.microsoft.com/en-us/windows/wsl/about) and just run things
on the Linux terminal.

## Running the environment with Tilt

Run this and follow terminal instructions to load the Tilt console:

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
