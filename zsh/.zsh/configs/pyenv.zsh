export PATH="$HOME/.pyenv/shims:$PATH"
eval "$(pyenv init -)"

if which pyenv-virtualenv-init > /dev/null; then
	eval "$(pyenv virtualenv-init -)";
fi
