#!/bin/bash
#Lihtne interaktiivne varundus
#Autor: Taivo Tobreluts
#Changed: 07.04.26

#küsib varundatava kausta nime
echo "Millist kausta soovid varundada?"
read kaust1

#küsib sihtkausta nime
echo "Kuhu soovid selle varundada?"
read kaust2

#moodustab varundusfaili nime: kaust1_backup-YYYYMMDD-HHMMSS.tar.gz
varunduse_nimi="$kaust1""-backup-$(date +%Y%m%d-%H%M%S).tar.gz"

#varundab tar-iga, peidab (viskab minema) käsu väljundi
tar -czf "$kaust2/$varunduse_nimi" "$kaust1" >/dev/null

#teavitab tulemusest
echo "Kausta $kaust1 varundamine kausta $kaust2 on lõppenud"
echo "Varundusfaili nimi on $varunduse_nimi"