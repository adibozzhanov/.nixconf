pushd ~/.nixconf
git diff --minimal -U0
git add -A
echo "NixOS Rebuilding..."
sudo nixos-rebuild switch --flake ".?submodules=1"
home-manager switch --flake ".?submodules=1"
git commit -am "NixOs rebuild: $(nixos-rebuild list-generations | grep current)"
popd
