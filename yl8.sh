#!/bin/bash
#Täiendatud interaktiivne varundus
#Autor: Taivo Tobreluts
#Changed: 20.04.26

#küsib varundatava kausta nime
echo "Millist kausta soovid varundada?"
read -r kaust1

#kontrollib kas varundatav kaust on olemas, kui mitte lõpetab töö
if [ ! -d "$kaust1" ]
then
    echo "Kausta ei leitud, skript lõpetab oma töö"
    exit 1
fi

#küsib sihtkausta nime
echo "Kuhu soovid seda varundada?"
read -r kaust2

#kontrollib kas sihtkaust on olemas, kui mitte lõpetab töö
if [ ! -d "$kaust2" ]
then
    echo "Kausta ei leitud, skript lõpetab oma töö"
    exit 1
fi

#moodustab varundusfaili nime: varundus_DD.MM.YY_HH.MM.SS.tar.gz
varunduse_nimi="varundus_$(date +%d.%m.%y_%H.%M.%S).tar.gz"

#varundab tar-iga, peidab nii tavaväljundi kui ka veavoo
tar -czf "$kaust2/$varunduse_nimi" "$kaust1" >/dev/null 2>/dev/null

#kontrollib kas varundusfail tekkis, kui mitte teavitab ebaõnnestumisest ja lõpetab töö
if [ ! -f "$kaust2/$varunduse_nimi" ]
then
    echo "Varundamine ebaõnnestus"
    exit 1
fi

#varundamine õnnestus, teavitab tulemusest
echo "$kaust1 kausta varundamine $kaust2 kausta on edukalt lõppenud, varundusfaili nimi on: $varunduse_nimi"
