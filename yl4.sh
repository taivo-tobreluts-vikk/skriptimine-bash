#!/bin/bash
#Logifailide varundusskript
#Autor: Taivo Tobreluts
#Changed: 08.04.26

#varundatav kataloog
allikas="/var/log"

#varunduse sihtkataloog
sihtkaust="/varundus"

#varundusfaili nimi koos tänase kuupäeva ja kellaajaga
failinimi="varundus_$(date +%d.%m.%y_%H.%M.%S).tar.gz"

#varundab tar käsuga, peidab nii tavaväljundi kui ka veavoo
tar -czf "$sihtkaust/$failinimi" "$allikas" >/dev/null 2>/dev/null

#Cron ajastus (crontab -e)
#nagu tunnis sai öeldud tuleb jooksutada root kasutaja crontab alt, kuna teeb operatsioone kataloogides millel tavakasutajal õigusi ei ole
#0 4 * * * /home/student/skriptimine-bash/yl4.sh