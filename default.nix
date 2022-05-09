let
  pkgs = import <nixpkgs> {};
  lib = import <nixpkgs/lib>;
  extensions = (with pkgs.vscode-extensions; [
    bbenoist.nix
    golang.go
    redhat.vscode-yaml
    zxh404.vscode-proto3
    editorconfig.editorconfig
    ms-azuretools.vscode-docker
    ms-kubernetes-tools.vscode-kubernetes-tools
  ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "Tiltfile";
      publisher = "tilt-dev";
      version = "0.0.3";
      sha256 = "KQ+jmVwHH/9iqmS6mYGxZMMmVisI2FqMMCDUi9AJCcY=";
    }
    {
      name = "vscode-bazel";
      publisher = "BazelBuild";
      version = "0.5.0";
      sha256 = "JJQSwU3B5C2exENdNsWEcxFSgWHnImYas4t/KLsgTj4=";
    }
    {
      name = "vscode-buf";
      publisher = "bufbuild";
      version = "0.5.0";
      sha256 = "ePvmHgb6Vdpq1oHcqZcfVT4c/XYZqxJ6FGVuKAbQOCg=";
    }
  ];
  vscode-with-extensions = pkgs.vscode-with-extensions.override {
    vscode = pkgs.vscodium;
    vscodeExtensions = extensions;
  };
in
pkgs.mkShell {
  name="dev-environment";
  buildInputs = [
    pkgs.bazel-buildtools
    pkgs.bazelisk
    pkgs.buf
    pkgs.docker
    pkgs.go
    pkgs.golangci-lint
    pkgs.kubectl
    pkgs.kubernetes-helm
    pkgs.minikube
    pkgs.tilt
    vscode-with-extensions
  ];
  shellHook = ''  # commands to run when you enter the shell
    alias groot="git rev-parse --show-toplevel"
    alias cdg="cd $(groot)"
    alias code="codium"
    alias codeg="code $(groot)"
    alias tidy="$(groot)/tidy.sh"
    alias k="kubectl"
    alias mk="minikube"
    echo
    echo "$(tput bold)Development environment ready!$(tput sgr0)"
    echo
    echo "If this is a new repo, you should run $(tput setaf 13)tidy$(tput sgr0) to initialize it."
    echo
    echo "To run Tilt environment:"
    echo "  $(tput setaf 13)minikube start$(tput sgr0)"
    echo "  $(tput setaf 13)tilt up$(tput sgr0)"
  '';
}
