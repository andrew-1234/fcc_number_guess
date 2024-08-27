#!/bin/bash

PSQL="psql -q --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Prompt: enter username 
echo "Enter your username: "
read USERNAME

# Query database for username
USER_EXISTS=$($PSQL "SELECT username FROM logs WHERE username = '$USERNAME'")

if [ -z "$USER_EXISTS" ]; then
  $PSQL "INSERT INTO logs (username, games_played, best_game) VALUES ('$USERNAME', 0, 0)"
  GAMES_PLAYED=0
  BEST_GAME=0
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM logs WHERE username = '$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM logs WHERE username = '$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Generate a random number between 1 and 1000
RANDOM_NUMBER=$(shuf -i 1-1000 -n 1)

echo "Guess the secret number between 1 and 1000: "
read INPUT

GUESSES=0

while [[ true ]]; do
  if ! [[ $INPUT =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
  elif [[ $INPUT -lt $RANDOM_NUMBER ]]; then
    echo "It's higher than that, guess again:"
  elif [[ $INPUT -gt $RANDOM_NUMBER ]]; then
    echo "It's lower than that, guess again:"
  else
    GUESSES=$((GUESSES + 1))
    if [[ $GAMES_PLAYED -eq 0 ]] || [[ $GAMES_PLAYED -gt 0 && $BEST_GAME -gt $GUESSES ]]; then
      $PSQL "UPDATE logs SET best_game = $GUESSES WHERE username = '$USERNAME'"
    fi
    
    GAMES_PLAYED=$((GAMES_PLAYED + 1)) 
    $PSQL "UPDATE logs SET games_played = $GAMES_PLAYED WHERE username = '$USERNAME'"
    
    echo "You guessed it in $GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
    break
  fi
  
  GUESSES=$((GUESSES + 1))
  read INPUT

done
