#!/bin/bash
#Logifailide varundusskript vastavalt nädalapäevale
#Autor: Taivo Tobreluts
#Changed: 20.04.26

#varundatav kataloog
allikas="/var/log"

#tänane nädalapäev numbrina (1=E, 2=T, 3=K, 4=N, 5=R, 6=L, 7=P)
#https://man7.org/linux/man-pages/man1/date.1.html :
#%u     day of week (1..7); 1 is Monday
nadalap=$(date +%u)

#määrab sihtkausta vastavalt nädalapäevale
case $nadalap in
    1|3|5)
        #esmaspäev, kolmapäev, reede
        sihtkaust="/home/student/varundus/esimene"
        ;;
    2|4|6)
        #teisipäev, neljapäev, laupäev
        sihtkaust="/home/student/varundus/teine"
        ;;
    7)
        #pühapäev
        sihtkaust="/home/student/varundus/kolmas"
        ;;
esac

#varundusfaili nimi koos tänase kuupäeva ja kellaajaga
failinimi="varundus_$(date +%d.%m.%y_%H.%M.%S).tar.gz"

#varundab tar käsuga, peidab nii tavaväljundi kui ka veavoo
tar -czf "$sihtkaust/$failinimi" "$allikas" >/dev/null 2>/dev/null

#Cron ajastus (root kasutaja crontab -e, kuna /var/log ja /varundus vajavad root õigusi)
#0 4 * * * /home/student/skriptimine-bash/yl6.sh
