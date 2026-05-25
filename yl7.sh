#!/bin/bash
#Valikuline skript if lause abil
#Autor: Taivo Tobreluts
#Changed: 20.04.26

#kontrollib, kas kaust /var/vanadfailid on olemas
if [ -d /var/vanadfailid ]
then
    #kaust on olemas: pakib kokku ja salvestab /var/backups kausta
    tar -czf /var/backups/varundus.tar.gz /var/vanadfailid >/dev/null 2>/dev/null

    #kustutab kõik failid kaustast, kuid jätab kausta ise alles
    rm -rf /var/vanadfailid/*

    echo "Varundus teostatud ja kaust tühjendatud"
else
    #kaust puudub
    echo "Kausta ei leitud, skript seiskub"
fi