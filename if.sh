#!/bin/bash

read -p "Sisesta number: " num

if [ $num -gt 100 ]
then
	echo "Sisestasid numbri mis on suurem kui 100"
	if [ $num -gt 1000 ]
	then
		echo "Number on ka suurem kui 1000"
		if [ $num -gt 1500 ]
        	then
                	echo "Number on ka suurem kui 1500"
        	fi

	fi
fi
