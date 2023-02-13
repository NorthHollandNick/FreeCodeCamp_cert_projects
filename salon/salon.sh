#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

SERVICE_NAME=''
FIRST_TIME_CHOOSING='true'

echo -e "\n~~~~~ SEEDY STAR SALON ~~~~~"

while [[ -z $SERVICE_NAME ]]
do
  if [[ $FIRST_TIME_CHOOSING == 'false' ]]
  then
    echo -e "\nThat service does not exist. Please select from our list."
  else
    echo -e "\nPlease consult the menu below to book one of our services.\n"
  fi

  # present list of services
  # echo -e $($PSQL "select * from services") | sed 's/|/) /g' 
  #                 | sed -r "s/ ([0-9])\)/\n\1\)/g"
  echo -e $($PSQL "select * from services") | sed 's/ | /) /g' \
                    | sed -r "s/ ([0-9]+\))/\n\1/g"

  # receive choice
  read SERVICE_ID_SELECTED

  # query database for service name
  SERVICE_NAME=$(echo $($PSQL "select name from services 
                            where service_id = $SERVICE_ID_SELECTED"))

  # update first time choosing variable            
  FIRST_TIME_CHOOSING='false'
done

# service_id and service name are now known.
# request phone number
echo -e "\nPlease enter your phone number."
read CUSTOMER_PHONE
# query database for customer name
CUSTOMER_NAME=$(echo $($PSQL "select name from customers 
                                        where phone = '$CUSTOMER_PHONE'"))
# check whether the customer exists
if [[ -z $CUSTOMER_NAME ]]
then
  # request name
  echo -e "\nYou are not yet known to our database. Please enter your name."
  read CUSTOMER_NAME
  # insert customer into database
  INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers (phone, name) values
                ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
fi
# read service time
echo -e "\nAt what time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
read SERVICE_TIME
# query customer_id
CUSTOMER_ID=$($PSQL "select customer_id from customers 
                                          where phone = '$CUSTOMER_PHONE'")
# insert appointment into database
INSERT_APPOINTMENT_RESULT=$($PSQL "insert into appointments 
                              (customer_id, service_id, time) values
                              ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
