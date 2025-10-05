.PHONY: help
## help: show this help message
help:
	@ echo "Usage: make [target]"
	@ sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

## sw: rebuild nixos-config
sw:
	sudo nixos-rebuild switch --flake .

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
	sudo darwin-rebuild switch --flake .

## gc: garbage collect old unused nix paths
gc:
	nix-collect-garbage -d

## debug: debug home-manager when it is failing to see what it causing it not to switch config properly
debug:
	journalctl -xe --unit home-manager-hx.service
