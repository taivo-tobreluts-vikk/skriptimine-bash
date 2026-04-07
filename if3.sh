#!/bin/bash

read -p "Sisesta number: "
read num
if [ $num -eq 100 ]
then
    echo "Sisestatud number on 100"
elif [ $num -gt 100 ]
then
    echo "Sisestatud number on suurem kui 100"
else
    echo "Sisestatud number on väiksem kui 100"
fi
