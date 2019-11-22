export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

if which pyenv-virtualenv-init > /dev/null; then
	eval "$(pyenv virtualenv-init -)";
fi
