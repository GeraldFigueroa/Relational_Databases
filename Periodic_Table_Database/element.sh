#!/bin/bash
PSQL="psql -X -U freecodecamp -d periodic_table --no-align --tuples-only -c"

MAIN_MENU(){

  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1;")
  else
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1' OR name = '$1';")
  fi

  if [[ -z $ATOMIC_NUMBER ]]
  then
    echo "I could not find that element in the database."
  else
    
    ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $ATOMIC_NUMBER;")
    ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $ATOMIC_NUMBER;")
    ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ATOMIC_NUMBER;")
    MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER;")
    BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER;")
    ELEMENT_TYPE=$($PSQL "SELECT type FROM properties INNER JOIN types USING(type_id) WHERE atomic_number = $ATOMIC_NUMBER;")
    
    echo "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  fi
}

if [[ $1 ]]
then
  MAIN_MENU $1
else
  echo "Please provide an element as an argument."
fi
