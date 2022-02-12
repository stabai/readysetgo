load("./tools/tilt/go_bazel/Tiltfile", "go_bazel_build")

go_bazel_build(
  name = "example-go-web",
  image_target = "//src/example/web/server:example-go-web-image",
  port = 8000,
)
go_bazel_build(
  name = "example-go-grpc",
  image_target = "//src/example/service:example-go-grpc-image",
  port = 50051,
)
