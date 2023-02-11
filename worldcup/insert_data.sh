#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# the TRUNCATE variable only exists to suppress output to the console
TRUNCATE=$($PSQL "truncate table games, teams restart identity")

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if (( YEAR != 'year' ))
  then
    # retrieve the IDs of the teams read
    WINNER_ID=$($PSQL "select team_id from teams where name = '$WINNER'");
    OPPONENT_ID=$($PSQL "select team_id from teams where name = '$OPPONENT'");
    # check if the teams read are new, add to database if true.
    # if added new, the new ID must be read for later use.
    if [[ -z $WINNER_ID ]]
    then
      WINNER_INSERTED_INTO_TEAMS=$($PSQL "insert into teams (name) values ('$WINNER')")
      WINNER_ID=$($PSQL "select team_id from teams where name = '$WINNER'");
    fi
    if [[ -z $OPPONENT_ID ]]
    then
      OPPONENT_INSERTED_INTO_TEAMS=$($PSQL "insert into teams (name) values ('$OPPONENT')")
      OPPONENT_ID=$($PSQL "select team_id from teams where name = '$OPPONENT'");
    fi
    # add all the info to the games table
    ROW_INSERTED_INTO_GAMES=$($PSQL "insert into games (year, round, winner_id, 
                            opponent_id, winner_goals, opponent_goals) 
        values ('$YEAR', '$ROUND', '$WINNER_ID', '$OPPONENT_ID',
                      '$WINNER_GOALS', '$OPPONENT_GOALS')")
  fi
done

