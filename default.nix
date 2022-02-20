{ pkgs ? import <nixpkgs> {}
}:
pkgs.mkShell {
  name="dev-environment";
  buildInputs = [
    pkgs.bazel-buildtools
    pkgs.bazelisk
    pkgs.docker
    pkgs.go
    pkgs.kubectl
    pkgs.minikube
    pkgs.tilt
  ];
  shellHook = ''  # commands to run when you enter the shell
    alias groot="git rev-parse --show-toplevel"
    alias cdg="cd $(groot)"
    alias tidy="$(groot)/tidy.sh"
    echo
    echo "$(tput bold)Development environment ready!$(tput sgr0)"
    echo
    echo "To run Tilt environment:"
    echo "  $(tput setaf 13)minikube start$(tput sgr0)"
    echo "  $(tput setaf 13)tilt up$(tput sgr0)"
  '';
}