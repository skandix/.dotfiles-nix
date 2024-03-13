update:
	nix flake update

switch:
	sudo nixos-rebuild switch --flake .

install-os:
	# format disks then run this!
	nixos-install --no-root-passwd --flake github:skandix/.nix-conf#DeathStar

