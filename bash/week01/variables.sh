!/bin/bash

NAME="Ernesto"
COUNTRY="Brasil"
CITY="Balneário Camboriú"
CURRENT_USER=$(whoami)
TODAY="$(date)"
HOST="$(hostname)"

echo "Name: $NAME"
echo "Country: $COUNTRY"
echo "City: $CITY"
echo "Usuario: $CURRENT_USER"
echo "Date: $TODAY"
echo "Host: $HOST"

