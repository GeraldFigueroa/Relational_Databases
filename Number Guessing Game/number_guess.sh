#!/bin/bash
PSQL="psql -U freecodecamp -d number_guess -t --no-align -c"

INSERT_VALUES(){
  if [[ $1 ]]
  then

    USER_ID=$1
    USERNAME=$2
    NUMBER_OF_GUESSES=$3
    SECRET_NUMBER=$4

    if [[ $USER_ID -eq -1 ]]
    then
      INSERT_USERNAME_RESULT=$($PSQL "INSERT INTO users(username) values ('$USERNAME');")

      if [[ $INSERT_USERNAME_RESULT == 'INSERT 0 1' ]]
      then
        USER_ID=$($PSQL "SELECT user_id from users WHERE username = '$USERNAME'")
      else  
        echo "An error occurred while inserting the user."
      fi
    fi

    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, secret_number, number_of_guesses) VALUES ($USER_ID, $SECRET_NUMBER, $NUMBER_OF_GUESSES)")
    if [[ ! $INSERT_GAME_RESULT == 'INSERT 0 1' ]]
    then
        echo "An error occurred while inserting the game."
    fi

  fi
}

MAIN_GAME(){
  
  if [[ $1 ]]
  then

    USER_ID=$1
    USERNAME=$2

    SECRET_NUMBER=$(( RANDOM % 1001 ))
    USER_NUMBER=-1
    NUMBER_OF_GUESSES=0

    echo "Guess the secret number between 1 and 1000:"
    
    while [[ ! $USER_NUMBER -eq $SECRET_NUMBER ]]
    do
      read USER_NUMBER

      if [[ $USER_NUMBER =~ ^[0-9]+$ ]]
      then
        if [[ $SECRET_NUMBER -gt $USER_NUMBER ]]
        then
          echo "It's higher than that, guess again:"
        elif [[ $SECRET_NUMBER -lt $USER_NUMBER ]]
        then
          echo "It's lower than that, guess again:"
        fi
      else
        echo "That is not an integer, guess again:"
      fi

      (( NUMBER_OF_GUESSES+=1 ))

    done

    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

    INSERT_VALUES $USER_ID $USERNAME $NUMBER_OF_GUESSES $SECRET_NUMBER
    
  fi
  
}

MAIN_MENU(){
  echo "Enter your username:"
  read USERNAME

  USER_ID=$($PSQL "SELECT user_id from users WHERE username = '$USERNAME'")

  if [[ -z $USER_ID ]]
  then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    USER_ID=-1
  else
    # USER_NAME=$($PSQL "SELECT username FROM users WHERE user_id = $USER_ID;")
    GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id = $USER_ID;")
    BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE user_id = $USER_ID;")
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi
  
  MAIN_GAME $USER_ID $USERNAME

}

MAIN_MENU