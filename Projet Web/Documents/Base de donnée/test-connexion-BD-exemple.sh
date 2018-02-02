#!/bin/bash
##############################
#Script test_connexion-BD.sh #
##############################

#Declaration des variables
hote="localhost"
name_BD="whereis"
login="root"
password="sio."
Base_SQL="whereis"
File_BD=""


#Debut du script

test=`mysql -u${login} -p${password} ${name_BD} << MyNbMAC
show tables;
MyNbMAC`

echo "$test"
