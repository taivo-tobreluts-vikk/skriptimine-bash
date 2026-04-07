#!/bin/bash
#Interaktiivne kopeerimine
#Autor: Taivo Tobreluts
#Changed: 07.04.26

#küsib kasutaja käest millist kausta kopeerida, salvestab muutuja kaust1
read -p "Millist kausta soovid kopeerida?: " kaust1
#kontrollib kas kataloog on olemas (-d -directory exists)
if [ -d $kaust1 ]
then
    echo "Kaust on olemas, jätkame..."
#kui ei ole siis lõpetab veaga (exit 1) 
else
    echo "Kaust puudub, skript lõpetab töö"
    exit 1
fi
#küsib kasutaja käest kuhu kopeerida, salvestab muutuja kaust2
read -p "Kuhu soovid selle kopeerida?: " kaust2

#kontrollib uuesti, kas kataloog on olemas, kui on kopeerib
if [ -d $kaust2 ]
then
    cp -r $kaust1 $kaust2
    echo "\"$kaust1\" kausta kopeerimine \"$kaust2\" kausta on lõppenud."
#kui ei ole siis loob kausta ja kopeerib
else
    echo "Kaust puudub, loon kausta"
    mkdir $kaust2
    cp -r $kaust1 $kaust2
    echo "\"$kaust1\" kausta kopeerimine \"$kaust2\" kausta on lõppenud."
fi