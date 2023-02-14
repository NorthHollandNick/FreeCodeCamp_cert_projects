#!/bin/bash

# initialize PSQL variable
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# generate random secret number
SECRET_NUM=$(( 1 + RANDOM % 1000 ))

# read the username
echo "Enter your username:"
read USERNAME

# query the database
RESULT=$($PSQL "select games_played, best_game from users where username = '$USERNAME'")

# process the query result
IFS='|' read GAMES_PLAYED BEST_GAME <<< $RESULT

# reply to user
if [[ -z $RESULT ]]
then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# the guessing loop
NUM_GUESSES=0
echo "Guess the secret number between 1 and 1000:"
# echo "secret spoiler: $SECRET_NUM"
while true
do
  read GUESS_NUM
  (( NUM_GUESSES++ ))
  # check whether the input represents an integer
  if [[ $GUESS_NUM =~ [1-9][0-9]* ]]
  then
    # compare to secret number, reply accordingly
    if [ $GUESS_NUM -gt $SECRET_NUM ]
    then
      echo "It's lower than that, guess again:"
    elif [ $GUESS_NUM -lt $SECRET_NUM ]
    then
      echo "It's higher than that, guess again:"
    elif [ $GUESS_NUM -eq $SECRET_NUM ]
    then
      echo "You guessed it in $NUM_GUESSES tries. The secret number was $SECRET_NUM. Nice job!"
      break
    else
      echo "THIS SHOULD NEVER HAPPEN"
      break
    fi
  else
    echo "That is not an integer, guess again:"
  fi
done

# we either insert new or update existing user, depending on RESULT obtained before
if [[ -z $RESULT ]]
then
  INSERT_USER_RESULT=$($PSQL "insert into users (username, best_game) values ('$USERNAME', $NUM_GUESSES)")
else
  (( GAMES_PLAYED++ ))
  if [ $NUM_GUESSES -lt $BEST_GAME ]
  then
    BEST_GAME=$NUM_GUESSES
  fi
  UPDATE_USER_RESULT=$($PSQL "update users set games_played = $GAMES_PLAYED, best_game = $BEST_GAME where username = '$USERNAME'")
fi

