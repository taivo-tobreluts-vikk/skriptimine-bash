#!/bin/bash

# for name in Peeter Juhan Mari Malle
# do
#    echo "Tere $name"
#    sleep 1

# done

#pingimisskript
#for ipas in 1.1.1.1 8.8.8.8 8.8.3.3
#do
#    ping -c 1 "$ipas"
#    sleep 1
#
#done

#töötab ka teistpidi {10..1}
# for num in {1..10}
# do
#     echo $num
#     sleep 1

# done

#samm on 1 asemel 2
# for num in {1..20..2} 
# do
#         echo $num
#         sleep 0.5
# done

#failide ümbernimetaja
kaust="/home/student/html /var/www /var/veebifailid"
# .html failide ümbernimetamine .php failideks (loob koopia) 
for value in $kaust/*.html
do
          cp $value $kaust/$( basename -s .html $value ).php # käsu basename abil saab teha failinime laiendi asendust
done