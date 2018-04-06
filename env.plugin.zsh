chenv() {
  local DIR="$HOME/.env"
  local PATTERN="?_$1:l.sh"
  local CONF=$(find $DIR -maxdepth 1 -name $PATTERN -print -quit)
  if test -n "$CONF"; then
      source $CONF
      export $(egrep -v '^[[:blank:]]*#|^[[:blank:]]*$' "$CONF" | cut -d= -f1)
  else
      return 1
  fi
}

lsenv() {
  local DIR="$HOME/.env"
  print -l $DIR/*.sh
}
