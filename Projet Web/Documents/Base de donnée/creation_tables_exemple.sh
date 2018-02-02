#!/bin/bash
##############################
#  Script creation_tables.sh #
##############################
#set -x

#Declaration des variables
hote="mysql-server"
name_BD="whereis"
login="arpuser"
password="userarp"

###################
# Debut du script #
###################

#Création des tables et des liens

TEMP=`mysql -h ${hote} -u${login} -p${password} ${name_BD} << MySCRIPT
CREATE TABLE mac (ID_MAC INT NOT NULL PRIMARY KEY AUTO_INCREMENT, Adresse_MAC CHAR(20));
CREATE TABLE ip (ID_IP INT NOT NULL PRIMARY KEY AUTO_INCREMENT, Adresse_IP CHAR(20),ID_Vlan int NOT NULL);
CREATE TABLE nom (ID_NOM INT NOT NULL PRIMARY KEY AUTO_INCREMENT, Nom_Poste CHAR(50));
CREATE TABLE vlan (ID_Vlan INT NOT NULL PRIMARY KEY AUTO_INCREMENT, Nom_Vlan char(20), Description_Vlan char(50));
CREATE TABLE poste (ID_Poste INT NOT NULL PRIMARY KEY AUTO_INCREMENT, ID_IP INT, ID_NOM INT, ID_Vlan INT, ID_MAC INT, Date_connexion char(12), ID_Baie INT, ID_Pile INT, ID_Port_Sw INT, ID_Adr_Sw INT);
CREATE TABLE baie (ID_Baie INT NOT NULL PRIMARY KEY AUTO_INCREMENT, Nom_Baie CHAR(30));
CREATE TABLE pile (ID_Pile INT NOT NULL PRIMARY KEY AUTO_INCREMENT, Nom_Pile CHAR(20), ID_Baie int not null);
CREATE TABLE port_sw (ID_Port_Sw INT NOT NULL PRIMARY KEY AUTO_INCREMENT, Num_Port_Sw CHAR(20), ID_Pile int not null);
CREATE TABLE adr_sw (ID_Adr_Sw INT NOT NULL PRIMARY KEY AUTO_INCREMENT, Num_Adr_Sw CHAR(20), ID_Pile int not null);
ALTER TABLE ip ADD FOREIGN KEY (ID_Vlan) REFERENCES vlan (ID_Vlan);
ALTER TABLE poste ADD FOREIGN KEY (ID_MAC) REFERENCES mac (ID_MAC);
ALTER TABLE poste ADD FOREIGN KEY (ID_NOM) REFERENCES nom (ID_NOM);
ALTER TABLE poste ADD FOREIGN KEY (ID_Vlan) REFERENCES vlan (ID_Vlan);
ALTER TABLE poste ADD FOREIGN KEY (ID_IP) REFERENCES ip (ID_IP);
ALTER TABLE poste ADD FOREIGN KEY (ID_Baie) REFERENCES baie (ID_Baie);
ALTER TABLE poste ADD FOREIGN KEY (ID_Pile) REFERENCES pile (ID_Pile);
ALTER TABLE poste ADD FOREIGN KEY (ID_Port_Sw) REFERENCES port_sw (ID_Port_Sw);
ALTER TABLE poste ADD FOREIGN KEY (ID_Adr_Sw) REFERENCES adr_sw (ID_Adr_Sw);
ALTER TABLE pile ADD FOREIGN KEY (ID_Baie) REFERENCES baie (ID_Baie);
ALTER TABLE port_sw ADD FOREIGN KEY (ID_Pile) REFERENCES pile (ID_Pile);
ALTER TABLE adr_sw ADD FOREIGN KEY (ID_Pile) REFERENCES pile (ID_Pile);
MySCRIPT`

exit 0

