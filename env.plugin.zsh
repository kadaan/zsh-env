chenv() {
  local DIR="$HOME/.env"
  local PATTERN="?_$1:l.sh"
  local CONF=$(find $DIR -maxdepth 1 -name $PATTERN -print -quit)
  if test -n "$CONF"; then
      source $CONF
      export $(egrep -v '^[[:blank:]]*#|^[[:blank:]]*$' "$CONF" | egrep -v '^.*=$' | cut -d= -f1)
      while read var; do
        unset $var
      done < <(egrep -v '^[[:blank:]]*#|^[[:blank:]]*$' "$CONF" | egrep '^.*=$' | cut -d= -f1)
  else
      echo "Environment '$1' does not exist" 1>&2
      return 1
  fi
}

lsenv() {
  local DIR="$HOME/.env"
  print -l $DIR/*.sh
}
