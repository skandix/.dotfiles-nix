update:
	nix flake update

switch:
	sudo nixos-rebuild switch --flake .

install-os:
	# format disks then run this!
	nixos-install --no-root-passwd --flake github:skandix/.nix-conf#DeathStar

macos:
	nix build .#darwinConfigurations."SpaceCruiser".system \
	   --extra-experimental-features 'nix-command flakes'

	./result/sw/bin/darwin-rebuild switch --flake .#SpaceCruiser
