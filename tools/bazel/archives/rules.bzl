"""Rules to load archives for Bazel plugins."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def rules_docker_archives(version, sha256):
    http_archive(
        name = "io_bazel_rules_docker",
        sha256 = sha256,
        strip_prefix = "rules_docker-%s" % version,
        urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v%s/rules_docker-v%s.tar.gz" % (version, version)],
    )

def rules_k8s_archives(version, sha256):
    http_archive(
        name = "io_bazel_rules_k8s",
        sha256 = sha256,
        strip_prefix = "rules_k8s-%s" % version,
        urls = ["https://github.com/bazelbuild/rules_k8s/archive/v%s.tar.gz" % version],
    )

def rules_go_archives(version, sha256):
    http_archive(
        name = "io_bazel_rules_go",
        sha256 = sha256,
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v%s/rules_go-v%s.zip" % (version, version),
            "https://github.com/bazelbuild/rules_go/releases/download/v%s/rules_go-v%s.zip" % (version, version),
        ],
    )

def gazelle_archives(version, sha256):
    http_archive(
        name = "bazel_gazelle",
        sha256 = sha256,
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v%s/bazel-gazelle-v%s.tar.gz" % (version, version),
            "https://github.com/bazelbuild/bazel-gazelle/releases/download/v%s/bazel-gazelle-v%s.tar.gz" % (version, version),
        ],
    )

def rules_proto_archives(version, sha256):
    http_archive(
        name = "rules_proto",
        sha256 = sha256,
        strip_prefix = "rules_proto-%s" % version,
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_proto/archive/refs/tags/%s.tar.gz" % version,
            "https://github.com/bazelbuild/rules_proto/archive/refs/tags/%s.tar.gz" % version,
        ],
    )
