#!/bin/bash
#Skript isc-dhcp serveri automaatpaigladuseks. Skript eeldab,et samasse masinasse tuleb ka DNS server
#netist leitud lahendus, 4 aastat vana, enne AI-d tehtud

MY_IP=$(ip route get 1.1.1.1 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')    #hangib serveri hetke IP-aadressi
MY_INT=$(ip route get 1.1.1.1 | awk -F"dev " 'NR==1{split($2,a," ");print a[1]}')   #hangib võrguliidese nime
POOLS=5       # DHCP pooli algus,    vajadusel muuta
POOLF=250     # DHCP pooli lõpp,     vajadusel muuta
GW=10.100.0.1 # Ruuteri aadress,     vajadusel muuta
DN=weblabs.ee # Domeeninimi,         vajadusel luuta

#isc-dhcp-serveri paigladamine
apt update
apt install isc-dhcp-server -y

#Kontroll, kas seda skripti on juba käivitatud, kui seadistus on olemas, siis skript peatub.
grep -q "DHCP serveri seadistus" /etc/dhcp/dhcpd.conf

if [ $? -eq 0 ]
then
        echo "DHCP seadistus on juba olemas, muutusi ei tehta"
        exit 1
fi

#/etc/dhcp/dhcpd.conf faili täitmine

cat <<EOT >> /etc/dhcp/dhcpd.conf
#DHCP serveri seadistus
subnet 10.100.0.0 netmask 255.255.255.0 {
range 10.100.0.$POOLS 10.100.0.$POOLF;
option domain-name-servers $MY_IP;
option domain-name "$DN";
option routers $GW;
option broadcast-address 10.100.0.255;
default-lease-time 600;
max-lease-time 7200;
}
EOT

# /etc/default/isc-dhcp-server faili kuulatava liidese lisamine
perl -pi -e s/INTERFACESv4='""'/INTERFACESv4=\"$MY_INT\"/g /etc/default/isc-dhcp-server

#teenuse taaskäivitamine
systemctl restart isc-dhcp-server