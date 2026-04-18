#!/bin/bash
#Interaktiivne kopeerimine võ liigutamine
#Autor: Taivo Tobreluts
#Changed: 15.04.26


read -p "Millist kausta soovid kopeerida?: " kaust1


if [ -d $kaust1 ]
then
    echo "Kaust on olemas, jätkame..."


else
    echo "Kaust puudub, skript lõpetab töö"
    exit 1
fi


read -p "Kuhu soovid selle kopeerida?: " kaust2


if [ -d $kaust2 ]
then
    cp -r $kaust1 $kaust2
    echo "\"$kaust1\" kausta kopeerimine \"$kaust2\" kausta on lõppenud."

else
    echo "Kaust puudub, loon kausta"
    mkdir $kaust2
    cp -r $kaust1 $kaust2
    echo "\"$kaust1\" kausta kopeerimine \"$kaust2\" kausta on lõppenud."
fi