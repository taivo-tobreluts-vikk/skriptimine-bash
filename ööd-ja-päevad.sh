#!/bin/bash


kp=$(date +%a)
#võivad jaguneda mitme rea vahel, ;; lõpetab
case $kp in
#näide kuidas eri päevadel juhtuvad erinevad asjad
	Mon|Sat) uptime;;
	Tue) date +%d.%m.%Y;;
	Wed|Thu|Fri) echo "Tere $USER!";;
	*) ;;
	#exit 0 on ilma veata lõpp, exit 1 annab veakoodi
esac
