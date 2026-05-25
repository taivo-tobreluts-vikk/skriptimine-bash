#!/bin/bash

# Loome funktsiooni mis kuvab teksti
# print_message () {
#   echo "Tere, mina olen funktsioon"
# }
# print_message # Kasutame funktsiooni
# sleep 1
# print_message # Kasutame funktsiooni
# sleep 1
# print_message # Kasutame funktsiooni


#huvitav argumentide kasutamise näide 1$ ja 2$ on tühikuga eraldatud argumendid funktsiooni järel
print_message () {
    echo "Minu nimi on, $2"
    sleep 1
    echo "1$ 2$"
}
print_message Jaan Tamm
sleep 1
print_message Peeter Paan
sleep 1
print_message Mari Maasikas