"""Rules for building gRPC services in Go."""

load("@io_bazel_rules_go//go:def.bzl", "GoLibrary", "go_library")

_TEMPLATE = "//src/server:main.tmpl"
_DEFAULT_PORT = 50051

def go_grpc_server(go_service_proto, go_service, base_importpath, service_name, default_port = _DEFAULT_PORT, **kwargs):
    """
    Creates a Go library for a gRPC server hosting the specified service.

    Args:
      go_service_proto: The Go library containing the proto service definition
      go_service: The Go library containing the implementation of the service
      base_importpath: The importpath of the Go library containing the
                       implementation of the service
      service_name: The name of the service as declared in the proto definition
      default_port: The default port that the server should run on
      **kwargs: Additional args for the generated go_library
    """

    name = kwargs.pop("name")
    main_file_target_name = "%s_main_file" % name
    go_proto_target = go_service_proto
    go_impl_target = go_service
    base_importpath = base_importpath
    go_grpc_service_main_file(
        name = main_file_target_name,
        go_service_proto = go_proto_target,
        go_service = go_impl_target,
        service_name = service_name,
        default_port = default_port,
    )
    go_library(
        name = name,
        srcs = [":%s" % main_file_target_name],
        importpath = "%s/cmd" % base_importpath,
        deps = [
            go_proto_target,
            go_impl_target,
            "@org_golang_google_grpc//:go_default_library",
            "@org_golang_google_grpc//health",
            "@org_golang_google_grpc//health/grpc_health_v1",
            "@org_golang_google_grpc//reflection",
        ],
        **kwargs
    )

def go_grpc_service_main_file(**kwargs):
    _go_grpc_service_main_file(
        source_file = "main.go",
        **kwargs
    )

def _go_grpc_service_main_file_impl(ctx):
    vars = {
        "{{ServiceImportPath}}": ctx.attr.go_service[GoLibrary].importpath,
        "{{PbImportPath}}": ctx.attr.go_service_proto[GoLibrary].importpath,
        "{{DefaultPort}}": str(ctx.attr.default_port),
        "{{ServiceName}}": ctx.attr.service_name,
    }
    ctx.actions.expand_template(
        template = ctx.file._template,
        output = ctx.outputs.source_file,
        substitutions = vars,
    )
    return [DefaultInfo(files = depset([ctx.outputs.source_file]))]

_go_grpc_service_main_file = rule(
    implementation = _go_grpc_service_main_file_impl,
    attrs = {
        "go_service": attr.label(
            allow_single_file = True,
            providers = [GoLibrary],
            mandatory = True,
        ),
        "go_service_proto": attr.label(
            allow_single_file = True,
            providers = [GoLibrary],
            mandatory = True,
        ),
        "service_name": attr.string(mandatory = True),
        "default_port": attr.int(),
        "_template": attr.label(
            default = Label(_TEMPLATE),
            allow_single_file = True,
        ),
        "source_file": attr.output(mandatory = True),
    },
)
