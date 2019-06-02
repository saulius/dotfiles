function terminal-notify() {
  $@
  terminal-notifier -title "Terminal" -message "Finished executing $1"
}
alias tn='terminal-notify'
