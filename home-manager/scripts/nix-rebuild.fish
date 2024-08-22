pushd ~/.nixconf
git diff --minimal -U0
echo "NixOS Rebuilding..."
sudo nixos-rebuild switch --flake ./ &>.nix-switch.log || cat .nix-switch.log | grep --color error && false
git add -A
git commit -am "$(nixos-rebuild list-generations | grep current)"
popd

