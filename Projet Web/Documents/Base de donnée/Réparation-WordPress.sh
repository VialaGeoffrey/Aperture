#!/bin/bash
###################################
#  Script Réparation-WordPress.sh #
###################################
#set -x

#Declaration des variables
hote="localhost"
name_BD="aperture"
login="user"
password="useraperture!"

###################
# Debut du script #
###################

#Création des tables et des liens

TEMP=`mysql -h ${hote} -u${login} -p${password} ${name_BD} << MySCRIPT
DROP USER 'user'@'localhost';
CREATE USER 'user'@'localhost' IDENTIFIED BY 'useraperture!';
GRANT ALL PRIVILEGES ON *.* TO 'user'@'localhost' REQUIRE NONE WITH GRANT OPTION MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;
GRANT ALL PRIVILEGES ON `aperture`.* TO 'user'@'localhost';
MySCRIPT`

exit 0

