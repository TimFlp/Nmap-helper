#!/bin/bash

Init() {
    read -p "Entrez l'ip cible : " ip
}

liste_choix() {
echo -e "[1] : Scan simple sans fichier de sortie\n[2] : Scan modéré sans fichier de sortie\n[3] : Scan approfondi sans fichier de sortie\n[4] : Scan simple avec fichier de sortie\n[5] : Scan modéré avec fichier de sortie\n[6] : Scan approfondi avec fichier de sortie"
read -p "Choix : " choice
}

Scans() {

if [ $choice -eq 1 ];then
	echo -e 'Scan choisi : \e[32mScan simple sans fichier de sortie\e[0m\nCommande lancée : nmap '$ip' -v' 
	sleep 2
	clear
	sudo nmap $ip -v
	restart
	clear
	
elif [ $choice -eq 2 ];then
	echo -e 'Scan choisi : \e[32mScan modéré sans fichier de sortie\e[0m\nCommande lancée : nmap '$ip' -O -vv' 
	sleep 2
	clear
	sudo nmap $ip -O -vv
	restart
	clear
	
elif [ $choice -eq 3 ];then
	echo -e 'Scan choisi : \e[32mScan approfondi sans fichier de sortie\e[0m\nCommande lancée : nmap '$ip' -A -O -vv -Pn' 
	sleep 2
	clear
	sudo nmap $ip -A -O -vv -Pn
	restart
	clear
	
elif [ $choice -eq 4 ];then
	echo -e 'Scan choisi : \e[32mScan simple avec fichier de sortie\e[0m' 
    	read -p "Entrez le PATH du fichier de résultat : " path
    	read -p "Entrez le nom du fichier voulu (Sans extensions) : " name
    	echo -e "Commande lancée : nmap '$ip' -oN '$path'/'$name'.txt"
    	sleep 2
	clear
	sudo nmap $ip -oN $path/$name.txt
	restart
	clear

elif [ $choice -eq 5 ];then
	echo -e 'Scan choisi : \e[32mScan modéré avec fichier de sortie\e[0m'
    	read -p "Entrez le PATH du fichier de résultat : " path
    	read -p "Entrez le nom du fichier voulu (Sans extensions) : " name
    	echo -e "Commande lancée : nmap '$ip' -O -vv -oN '$path'/'$name'.txt"
	sleep 2
	clear
	sudo nmap $ip -O -vv -oN $path/$name.txt
	restart
	clear

elif [ $choice -eq 6 ];then
	echo -e 'Scan choisi : \e[32mScan approfondi avec fichier de sortie\e[0m'
    read -p "Entrez le PATH du fichier de résultat : " path
    read -p "Entrez le nom du fichier voulu (Sans extensions) : " name
    echo -e "Commande lancée : nmap '$ip' -A -O -Pn -oN '$path'/'$name'.txt" 
	sleep 2
	clear
	sudo nmap $ip -A -O -Pn -oN $path/$name.txt
	restart
	clear
	
else
	echo -e  'Entrée non conforme.\nArrêt du programme.'
	sleep 3
	exit 1
fi
}

restart() {
    read -p "Souhaitez vous performer un autre scan ? (y/n) : " end
    if [ "$end" == "y" ]; then
            clear	
            Init
            liste_choix
            Scans
    elif [ "$end" == "n" ]; then
            echo "Aurevoir !"
            exit 1
    else
        exit 2
    fi
}

clear
echo -e  "\e[32mUtilitaire pour nmap\e[0m\n\e[32mPour simplifier les ctf\e[0m"
Init
clear
liste_choix
clear
Scans
