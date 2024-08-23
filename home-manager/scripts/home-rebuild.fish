pushd ~/.nixconf
git diff --minimal -U0
echo "Home manager rebuilding..."
git add -A
home-manager switch --flake ./ &>.home-switch.log || cat .home-switch.log | grep --color error && false
git commit -am "Home rebuild: $(home-manager generations | head -n 1)"
popd
