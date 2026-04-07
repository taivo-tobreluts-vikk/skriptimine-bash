#!/bin/bash

read -p "Millist kausta sa soovid kopeerida?: " kaust1
if [ -d $kaust1 ]
then
    echo "Kaust on olemas, jätkame..."
else
    echo "Kaust puudub, skript lõpetab töö"
    exit 1
fi

read -p "Millisesse kausta sa soovid seda kopeerida: " kaust2

if [ -d $kaust2 ]
then
    echo "Kaust on olemas, jätkame..."
    cp -r $kaust1 $kaust2
else
    echo "Kaust puudub, loon kausta"
    mkdir $kaust2
    cp -r $kaust1 $kaust2
fi
