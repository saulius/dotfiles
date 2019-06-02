function genpass {
  ((test -n "$1" && test "$1" -ge 0) && \
    pwgen -s -N 1 -cny $1) 2>&-;
}
