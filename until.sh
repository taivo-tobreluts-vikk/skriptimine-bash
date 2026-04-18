#!/bin/bash

num=1

while [ $num -le 10 ]
do
    echo "muutuja väärtus on $num"
    #num-- vähendab ja num++ suurendab ühe võrra
    (( num++ ))
    #1 sek ootab (võib ka olla alla ühe)
    sleep 1
done