pushd ~/.nixconf
git diff --minimal -U0
echo "NixOS Rebuilding..."
git add -A
sudo nixos-rebuild switch --flake ./ &>.nix-switch.log || cat .nix-switch.log | grep --color error && false
git commit -am "NixOs rebuild: $(nixos-rebuild list-generations | grep current)"
popd


