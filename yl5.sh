#!/bin/bash
#Interaktiivne kopeerimine või liigutamine
#Autor: Taivo Tobreluts
#Changed: 15.04.26
#Skript laseb kasutajal interaktiivselt valida kas kausta liigutada (mv) või kopeerida (cp).

#Skript annab valiku
echo "Millist kausta soovid kopeerida või liigutada, tee oma valik: "
echo
echo "a = kausta kopeerimine"
echo "b = kausta liigutamine"
echo
#Loeme kasutaja valiku muutujaks
read valik
#Case skript, mis käivitab tegevuse vastavalt kasutaja valikule
case $valik in
	a)
    read -p "Millist kausta soovid kopeerida?: " kaust1

    #kontrollib kas kataloog on olemas (-d -directory exists)
    if [ -d $kaust1 ]
    then
        echo "Kaust on olemas, jätkame..."

    #kui ei ole siis lõpetab veaga (exit 1) 
    else
        echo "Tundmatu valik, skript lõpetab töö!"
        exit 1
    fi

    #küsib kasutaja käest kuhu kopeerida, salvestab muutuja kaust2
    read -p "Kuhu soovid selle kopeerida?: " kaust2

    #kontrollib uuesti, kas kataloog on olemas, kui on kopeerib
    if [ -d $kaust2 ]
    then
        cp -r $kaust1 $kaust2
        echo "\"$kaust1\" kausta kopeerimine \"$kaust2\" kausta on lõppenud."
    #kui ei ole siis loob kataloogi ja kopeerib
    else
        echo "Kaust puudub, loon kausta"
        mkdir $kaust2
        cp -r $kaust1 $kaust2
        echo "\"$kaust1\" kausta kopeerimine \"$kaust2\" kausta on lõppenud."
    fi
    ;;
	b) 
        read -p "Millist kausta soovid liigutada?: " kaust1

    #kontrollib kas kataloog on olemas (-d -directory exists)
    if [ -d $kaust1 ]
    then
        echo "Kaust on olemas, jätkame..."

    #kui ei ole siis lõpetab veaga (exit 1) 
    else
        echo "Kaust puudub, skript lõpetab töö"
        exit 1
    fi

    #küsib kasutaja käest kuhu liigutada, salvestab muutuja kaust2
    read -p "Kuhu soovid selle liigutada?: " kaust2

    #kontrollib uuesti, kas kataloog on olemas, kui on liigutab
    if [ -d $kaust2 ]
    then
        mv $kaust1 $kaust2
        echo "\"$kaust1\" kausta kopeerimine \"$kaust2\" kausta on lõppenud."
    #kui ei ole siis loob kataloogi ja liigutab
    else
        echo "Kaust puudub, loon kausta"
        mkdir $kaust2
        mv $kaust1 $kaust2
        echo "\"$kaust1\" kausta kopeerimine \"$kaust2\" kausta on lõppenud."
    fi
    ;;
    *) echo "Tundmatu valik, skript lõpetab töö."
    exit 1;;
esac
