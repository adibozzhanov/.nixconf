pushd ~/.nixconf
git diff --minimal -U0
echo "Home manager rebuilding..."
home-manager switch --flake ./ &>.home-switch.log || cat .home-switch.log | grep --color error && false
git add -A
git commit -am "$(home-manager generations | head -n 1)"
popd
