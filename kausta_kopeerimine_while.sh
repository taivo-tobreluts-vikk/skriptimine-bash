#!/bin/bash

read -p "Siseseta varundatav kaust kujul /kaust/alamkaust: " kaust1

while [ ! -d $kaust1 ]
do
    echo "varundatavat kausta ei leitud, sisesta kaust uuesti!"
    read -p "Siseseta varundatav kaust kujul /kaust/alamkaust: " kaust1
done

echo "Kaust on olemas, jätkan..."