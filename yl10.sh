#!/bin/bash
#Serverite töö kontroll
#Autor: Taivo Tobreluts
#Changed: 24.05.26

#serverite IP aadressid muutujatena (kolmas on olematute IP, et saada veateade)
#Inxskript-test1
server1="10.100.0.201"
#Inxskript-test2
server2="10.100.0.202"
#vale aadress
server3="10.100.0.205"

#ssh kasutajanimi serveritesse sisselogimiseks (enne ssh sisselogimine ära teha)
sshkasutaja="student"

#logifail kuhu kirjutatakse kättesaamatud serverid
logifail="/home/student/Skriptid/serverid.txt"

#käib kõik kolm serverit for tsükliga läbi
for server in $server1 $server2 $server3
do
    #pingib serverit (1 pakett), peidab väljundi ja veavoo, kontrollib tulemust otse
    if ping -c 1 "$server" >/dev/null 2>/dev/null
    then
        echo "Server $server on võrgus kättesaadav"

        #küsib ssh kaudu mis ajast alates server töötab
        algus=$(ssh "$sshkasutaja@$server" "uptime -s")
        echo "Server on töös olnud alates: $algus"

    else
        echo "Server $server pole võrgus kättesaadav"

        #lisab logifaili kuupäeva, kellaaja ja serveri IP (>> lisab faili lõppu, ei kirjuta üle)
        echo "$(date '+%d.%m.%y %H:%M:%S') - $server pole kättesaadav" >> "$logifail"
    fi

done
