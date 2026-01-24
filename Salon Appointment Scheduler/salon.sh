#! /bin/bash

PSQL="psql -X -U freecodecamp -d salon --tuples-only -c"

echo -e "\n~~~~~ Salon Appointment Scheduler ~~~~~\n"

SERVICE_SELECTION(){

  if [[ ! $1 ]]
  then
    MAIN_MENU "An error occurred while selecting the service, try again"
  fi

  SERVICE_ID_SELECTED=$1

  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME

    if [[ -z $CUSTOMER_NAME ]]
    then
      MAIN_MENU "the name entered is not valid"
    else
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi

    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    echo -e "\nWhat time do you prefer?"
    read SERVICE_TIME

    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    if [[ $INSERT_APPOINTMENT_RESULT == 'INSERT 0 1' ]]
    then
      echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
    else
      echo "We're sorry, an error occurred while making your appointment."
    fi
  fi

}

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  LIST_SERVICES=$($PSQL "SELECT service_id, name FROM services;")

  if [[ -z $LIST_SERVICES ]]
  then
    echo -e "Sorry, we don't have any services available right now."
  else
    echo "$LIST_SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
    do
      echo "$SERVICE_ID) $SERVICE_NAME"
    done

    echo -e "\nWhat service would you like to select?"
    read SERVICE_ID_SELECTED

    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
      MAIN_MENU "That is not a valid service number"
    else
      SERVICE_EXISTS=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED;")

      if [[ -z $SERVICE_EXISTS ]]
      then
        MAIN_MENU# "That service is not available"
      else
        SERVICE_SELECTION $SERVICE_ID_SELECTED
      fi
    fi
  fi
}


MAIN_MENU