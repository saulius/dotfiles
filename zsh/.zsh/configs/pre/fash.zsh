# load fasd fast
# https://github.com/clvv/fasd/issues/18#issuecomment-422921618
eval "$(fasd --init posix-alias)" # Anything you want enabled BUT zsh-hook

_fasd_preexec() {
    { eval "fasd --proc \$(fasd --sanitize \$2)"; } &|
}
autoload -Uz add-zsh-hook
add-zsh-hook preexec _fasd_preexec

alias j='fasd_cd -d'

jj() {
  local dir
  dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}
