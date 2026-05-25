#!/bin/bash
#Numbrite ära arvamine
#Autor: Taivo Tobreluts
#Changed: 08.05.26

#genererib numbri mida ära arvata
randnum=$((RANDOM % 20 + 1))
#tsüklite loendur muutuja
katse=1

echo "Arva ära 1 number ühest 20-ni:"

read paknum

#if [ $paknum -eq $randnum ]
#then
    # echo "Õige! Number oligi $paknum."
    # echo "Arvasid ära $katse katsega!"
# elif [ $paknum -gt $randnum ]
# then
#     echo "Sisestatud number on suurem kui $paknum"
# else
#     echo "Sisestatud number on väiksem kui $paknum"
# fi

# until [ $paknum -eq $randnum ]
# do
#     if [ $paknum -eq $randnum ]
#     echo "muutuja väärtus on $num"
#     #num-- vähendab ja num++ suurendab ühe võrra
#     (( katse++ ))
#     #1 sek ootab (võib ka olla alla ühe)
#     sleep 1
# done

# tsükkel töötab kuni pakutud number on võrdne salajase numbriga
until  [ $paknum -eq $randnum ]
do 
    if [ $paknum -lt $randnum ]
    then
      echo "Pakutud number on suurem kui $paknum. Paku uuesti:"
      read paknum
      ((katse++))
    else
      echo "Pakutud number on väiksem kui $paknum. Paku uuesti:"
      read paknum
      ((katse++))
    fi
done
echo "Õige! Number oligi $paknum."
echo "Arvasid ära $katse katsega!"