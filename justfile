flake := justfile_directory()
host := "zapolyarny-x380"

default:
  @just --list

check *args:
  nix flake check {{ flake }} {{ args }}

test *args:
  sudo nixos-rebuild test --flake {{ flake }}#{{ host }} {{ args }}

switch *args:
  sudo nixos-rebuild switch --flake {{ flake }}#{{ host }} {{ args }}

build *args:
  sudo nixos-rebuild build --flake {{ flake }}#{{ host }} {{ args }}

boot *args:
  sudo nixos-rebuild boot --flake {{ flake }}#{{ host }} {{ args }}

update *input:
  nix flake update {{ input }}

fmt:
  nix fmt {{ flake }}

lint:
  nix run nixpkgs#statix -- check .
  nix run nixpkgs#deadnix -- --fail .

fix-lint:
  nix run nixpkgs#deadnix -- --edit .
  nix run nixpkgs#statix -- fix .
  nix fmt {{ flake }}

clean:
  sudo nix-collect-garbage --delete-older-than 7d
  nix store optimise
