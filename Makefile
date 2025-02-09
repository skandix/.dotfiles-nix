.PHONY: help
## help: show this help message
help:
	@ echo "Usage: make [target]"
	@ sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

## up: updated nix flake
up:
	nix flake update

## sw: rebuild nixos-config
sw:
	NIXPKGS_ALLOW_UNFREE=1 sudo nixos-rebuild switch --flake .

## swt: rebuild nixos-config with trace
swt:
	sudo nixos-rebuild switch --flake . --show-trace

## val: validate flake
val:
	nix flake check .

## fmt: format nix files
fmt:
	nixfmt *.nix # it has deprecated use of '.' but it is still possible to use with wildcard

## macos: build macos nix-config
macos:
	nix run nix-darwin -- switch --flake .

# gc: garbage collect old unused nix paths
#gc:
	#nix-collect-garbage -d

# install-os:  FRESH INSTALL OF SYSTEM! NOTE: Need to format drives
#install-os:
	## format disks then run this!
	#nixos-install --flake github:skandix/.dotfiles-nix
