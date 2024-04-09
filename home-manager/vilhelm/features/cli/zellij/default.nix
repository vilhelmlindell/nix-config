{ config,pkgs, lib, ... }:
let
	zellij = import ./zellij.nix { inherit config; };
in
{
	programs.zellij.enable = true;
	home.file.${zellij.configPath}.text = zellij.configKdl;
	home.file.${zellij.layoutPath}.text = zellij.layoutKdl;
	#home.file."test".text = ''
	#	banana
	#'';
}
