workspace(name = "github_com_stabai_readysetgo")

load("//tools/bazel/archives:rules.bzl", "gazelle_archives", "rules_docker_archives", "rules_go_archives", "rules_k8s_archives", "rules_proto_archives")

# Go & Gazelle ###########################################
rules_go_archives(
    sha256 = "2b1641428dff9018f9e85c0384f03ec6c10660d935b750e3fa1492a281a53b0f",
    version = "0.29.0",
)

gazelle_archives(
    sha256 = "de69a09dc70417580aabf20a28619bb3ef60d038470c7cf8442fafcf627c21cb",
    version = "0.24.0",
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")
load("//tools/bazel/archives:external_go_deps.bzl", "external_go_deps")

external_go_deps()

go_rules_dependencies()

go_register_toolchains(version = "1.17.2")

gazelle_dependencies()
##########################################################

# Docker #################################################
rules_docker_archives(
    sha256 = "85ffff62a4c22a74dbd98d05da6cf40f497344b3dbf1e1ab0a37ab2a1a6ca014",
    version = "0.23.0",
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
