chenv() {
  DIR="$HOME/.env"
  PATTERN="?_$1:l.sh"
  if test -n "$(find $DIR -maxdepth 1 -name $PATTERN -print -quit)"; then
      source $DIR/?_$1:l.sh
      export $(egrep -v '^[[:blank:]]*#|^[[:blank:]]*$' "$HOME/.env/3_prod.sh" | cut -d= -f1)
  else
      echo "Environment '$1' does not exist" 1>&2
      return 1
  fi
}

lsenv() {
  DIR="$HOME/.env"
  print -l $DIR/*.sh
}
