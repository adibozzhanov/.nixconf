pushd ~/.nixconf
git diff --minimal -U0
git add -A
echo "NixOS Rebuilding..."
sudo nixos-rebuild switch --flake ./
git commit -am "NixOs rebuild: $(nixos-rebuild list-generations | grep current)"
popd


