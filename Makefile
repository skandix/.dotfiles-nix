up:
	nix flake update

sw:
	NIXPKGS_ALLOW_UNFREE=1 sudo nixos-rebuild switch --flake .

swt:
	sudo nixos-rebuild switch --flake . --show-trace

val:
	nix flake check .

macos:
	nix run nix-darwin -- switch --flake .

install-os:
	# format disks then run this!
	nixos-install --flake github:skandix/.dotfiles-nix
