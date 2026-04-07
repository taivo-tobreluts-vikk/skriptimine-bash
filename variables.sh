#!/bin/bash


nimi="Taivo"
kp=$(date +%d.%m.%Y)
#kp2=`date +%A`
fname="backup-$kp.tar.gz"
#echo "Tere $nimi"
#echo "Kuupäev on $kp"
#echo "See on $kp2"

#echo"$1"

#echo "Sisesta palun oma nimi:"
#read nimi
#echo "Tere $nimi!"
#echo "Sisesta oma perenimi:"
#read surname
#echo "Tere $surname!"

#ühel real küsimine
read -p "Sisesta palun oma eesnimi: " nimi

#salajane küsimine
read -sp "Sisesta oma parool: " psw

echo "sinu parool on: $psw"
