workspace(name = "github_com_stabai_readysetgo")

load("//tools/bazel/archives:rules.bzl", "gazelle_archives", "rules_docker_archives", "rules_go_archives", "rules_k8s_archives", "rules_proto_archives")

# Go & Gazelle ###########################################
rules_go_archives(
    sha256 = "16e9fca53ed6bd4ff4ad76facc9b7b651a89db1689a2877d6fd7b82aa824e366",
    version = "0.34.0",
)

gazelle_archives(
    sha256 = "5982e5463f171da99e3bdaeff8c0f48283a7a5f396ec5282910b9e8a49c0dd7e",
    version = "0.25.0",
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")
load("//tools/bazel/archives:external_go_deps.bzl", "external_go_deps")

go_rules_dependencies()

go_register_toolchains(version = "1.18.4")

# gazelle:repository_macro tools/bazel/archives/external_go_deps.bzl%external_go_deps
external_go_deps()

# gazelle:repo bazel_gazelle - suppress warning because repo is initialized in macro
gazelle_dependencies()
##########################################################

# Docker #################################################
rules_docker_archives(
    sha256 = "b1e80761a8a8243d03ebca8845e9cc1ba6c82ce7c5179ce2b295cd36f7e394bf",
    version = "0.25.0",
)

load("@io_bazel_rules_docker//repositories:repositories.bzl", container_repositories = "repositories")

container_repositories()

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

container_deps()

load("@io_bazel_rules_docker//go:image.bzl", go_image_repos = "repositories")

go_image_repos()
##########################################################

# K8s ####################################################
rules_k8s_archives(
    sha256 = "51f0977294699cd547e139ceff2396c32588575588678d2054da167691a227ef",
    version = "0.6",
)

load("@io_bazel_rules_k8s//k8s:k8s.bzl", "k8s_repositories")

k8s_repositories()

load("@io_bazel_rules_k8s//k8s:k8s_go_deps.bzl", k8s_go_deps = "deps")

k8s_go_deps()
##########################################################

# Proto ##################################################
rules_proto_archives(
    sha256 = "66bfdf8782796239d3875d37e7de19b1d94301e8972b3cbd2446b332429b4df1",
    version = "4.0.0",
)

load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")

rules_proto_dependencies()

rules_proto_toolchains()
##########################################################
