{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kubectl
    kubecolor
    k9s
    opentofu
    ansible
    openstackclient
    talosctl
    kubernetes-helm
    kubeseal
    packer
   ];
}