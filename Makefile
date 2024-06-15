up:
	nix flake update

sw:
	sudo nixos-rebuild switch --flake .

swt:
	sudo nixos-rebuild switch --flake . --show-trace

install-os:
	# format disks then run this!
	nixos-install --no-root-passwd --flake github:skandix/.nix-conf#DeathStar

macos:
	nix build .#darwinConfigurations."SpaceCruiser".system \
	--extra-experimental-features 'nix-command flakes'

	./result/sw/bin/darwin-rebuild switch --flake .#SpaceCruiser

val:
	nix flake check .