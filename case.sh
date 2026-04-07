#!/bin/bash

echo "Tee järgmine valik:"
echo "1 - Kuvab arvuti uptime"
echo "2 - Kuvab tänane kuupäev"
echo "3 - Tervitab kasutajat"
read valik
#võivad jaguneda mitme rea vahel, ;; lõpetab
case $valik in
	1) uptime;;
	2) date +%d.%m.%Y;;
	2) echo "Tere $USER!";;
	*) echo "Vale valik, skript seiskub"
	   exit 1;;
	#exit 0 on ilma veata lõpp, exit 1 annab veakoodi
esac
