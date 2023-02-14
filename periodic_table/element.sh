PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ ! $1 ]]
then
  echo "Please provide an element as an argument."
else
  # query the joined table.
  # if the argument is a number, query atomic_number
  if [[ $1 =~ [1-9]*[0-9] ]]
  then
    RESULT=$($PSQL "select * from elements join properties using (atomic_number) where atomic_number = $1")
  # if the argument is a capital letter maybe followed by a lower-case letter, query symbol
  elif [[ $1 =~ [A-Z][a-z]?$ ]]
  then
    RESULT=$($PSQL "select * from elements join properties using (atomic_number) where symbol = '$1'")
  # if the argument is a capital letter followed by at least two lower case letters, query name
  elif [[ $1 =~ [A-Z][a-z]{2,} ]]
  then
    RESULT=$($PSQL "select * from elements join properties using (atomic_number) where name = '$1'")
  fi
  # if RESULT is not empty, we separate it into components
  if [[ ! -z $RESULT ]]
  then
    IFS='|' read NUMBER SYMBOL NAME MASS MELTING BOILING TYPE_ID <<< $(echo $RESULT)
    # retrieve the type
    TYPE=$($PSQL "select type from types where type_id = $TYPE_ID")
    # build the output string in components
    C1="The element with atomic number $NUMBER is $NAME ($SYMBOL). "
    C2="It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point "
    C3="of $MELTING celsius and a boiling point of $BOILING celsius."
    # echo the final output
    echo $C1$C2$C3
  else
    echo "I could not find that element in the database."
  fi

fi

