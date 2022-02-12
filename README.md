# readysetgo

Starter template for a monorepo for Go microservices using gRPC, Bazel, and Tilt

## Prerequisites

You need the following tools installed to use this environment:

- [Bazelisk](https://github.com/bazelbuild/bazelisk)
  ([homebrew](https://formulae.brew.sh/formula/bazelisk),
  [manual](https://docs.bazel.build/versions/main/install-bazelisk.html))
- [Tilt](https://tilt.dev) ([homebrew](https://formulae.brew.sh/formula/tilt),
  [manual](https://docs.tilt.dev/install.html))
- [grpc_cli](https://github.com/grpc/grpc/blob/master/doc/command_line_tool.md)
  ([homebrew](https://formulae.brew.sh/formula/grpc),
  [manual](https://github.com/grpc/grpc/blob/master/doc/command_line_tool.md#code-location))

If you're using MacOS or Linux, you can install these easily using [Homebrew](https://brew.sh/):

```shell
brew install bazelisk grpc tilt-dev/tap/tilt
```

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
