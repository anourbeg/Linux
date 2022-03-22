#!/bin/bash

# création des groupes
sudo groupadd -g 2000 RECH
sudo groupadd -g 3000 DEV
sudo groupadd -g 4000 ING
sudo groupadd -g 5000 ADMRECH
sudo groupadd -g 6000 ADMDEV
sudo groupadd -g 7000 ADMING
sudo groupadd -g 8000 DIRECTION

# création d'un dossier pour sauvegarder les mots de passes users
sudo touch MDP
sudo chmod 1666 MDP
sudo echo Voici la liste des mots de passe>> MDP
sudo echo  >> MDP 

# boucle création des users RECH attribution des mots de passe aléatoires et copie dans le fichier MDP
uid=2000 
for z in ROD SAF ALC JEL SOA
 do
 ((++uid))
 #mdp=`< /dev/urandom tr -dc A-Z-a-z-0-9 | head -c12`
 #echo "Mot de passe" $z = $mdp
#sudo echo User $z: $mdp>> MDP
#sudo useradd -m -p $mdp $z
sudo useradd -m -p coucou $z
sudo usermod -u $uid $z
echo "UID" $uid "pour" $z
echo " "
sudo chage $z -M 60 #changement de mot de passe user après 60 jours
#clear
done


# boucle création des users DEV avec attribution des mots de passe aléatoires et copie dans le fichier MDP
uid=3000
for zz in NAD LIT KET JAD
 do
 ((++uid))
 #mdp=`< /dev/urandom tr -dc A-Z-a-z-0-9 | head -c12`
 #echo "Mot de passe" $zz = $mdp
#sudo echo User $zz: $mdp>> MDP
#sudo useradd -m -p $mdp $zz
sudo useradd -m -p coucou $zz
sudo usermod -u $uid $zz
echo "UID" $uid "pour" $zz
echo " "
sudo chage $zz -M 60 #changement de mot de passe user après 60 jours
#clear
done


# boucle de création des users ING avec attribution des mots de passe aléatoires et copie dans le fichier MDP
uid=4000
for zzz in HES ROM ALD
 do
 ((++uid))
 #mdp=`< /dev/urandom tr -dc A-Z-a-z-0-9 | head -c12`
 #echo "Mot de passe" $zzz = $mdp
#sudo echo User $zzz: $mdp>> MDP
#sudo useradd -m -p $mdp $zzz
sudo useradd -m -p coucou $zzz
sudo usermod -u $uid $zzz
echo "UID" $uid "pour" $zzz
echo " "
sudo chage $zzz -M 60 #changement de mot de passe user après 60 jours
#clear
done

# création user BIP avec attribution du mot de passe aléatoire et copie dans le fichier MDP
#mdp=`< /dev/urandom tr -dc A-Z-a-z-0-9 | head -c12`
#echo "Mot de passe" BIP = $mdp
#sudo echo User BIP: $mdp>> MDP
#sudo useradd -m -p $mdp BIP
sudo useradd -m -p coucou BIP

sudo usermod -u 8001 BIP
echo "UID" 8001 "pour" BIP
sudo chage BIP -M 60 #changement de mot de passe user après 60 jours


#Place les users dans les groupes
sudo usermod -g RECH -G ADMRECH ROD
sudo usermod -g DEV -G ADMDEV NAD
sudo usermod -g ING -G ADMING HES
sudo usermod -g DIRECTION -aG ADMRECH,ADMDEV,ADMING BIP

for x in SAF ALC JEL SOA
do
 sudo usermod -g RECH $x
done

for y in LIT KET JAD
do
 sudo usermod -g DEV $y
done

sudo usermod -g ING ROM
sudo usermod -g ING ALD

#mkdir : chaque user file
#chown : attribution des directory aux user
#chmod : changement permission

mkdir /home/ROD/Public
mkdir /home/ROD/Privé
mkdir /home/ROD/Admin Recherche
mkdir /home/ROD/Recherche
chown -R ROD:RECH /home/ROD

mkdir /home/SAF/Public
mkdir /home/SAF/Privé
mkdir /home/SAF/Recherche
chown -R SAF:RECH /home/SAF

mkdir /home/ALC/Public
mkdir /home/ALC/Privé
mkdir /home/ALC/Recherche
chown -R ALC:RECH /home/ALC

mkdir /home/JEL/Public
mkdir /home/JEL/Privé
mkdir /home/JEL/Recherche
chown -R JEL:RECH /home/JEL

mkdir /home/SOA/Public
mkdir /home/SOA/Privé
mkdir /home/SOA/Recherche
chown -R SOA:RECH /home/SOA

mkdir /home/NAD/Public
mkdir /home/NAD/Privé
mkdir /home/NAD/Admin Développement
mkdir /home/NAD/Développement
chown -R NAD:DEV /home/NAD

mkdir /home/LIT/Public
mkdir /home/LIT/Privé
mkdir /home/LIT/Développement
chown -R LIT:DEV /home/LIT

mkdir /home/KET/Public
mkdir /home/KET/Privé
mkdir /home/KET/Développement
chown -R KET:DEV /home/KET

mkdir /home/JAD/Public
mkdir /home/JAD/Privé
mkdir /home/JAD/Développement
chown -R JAD:DEV /home/JAD

mkdir /home/HES/Public
mkdir /home/HES/Privé
mkdir /home/HES/Admin ingénierie
mkdir /home/HES/ingénierie
chown -R HES:ING /home/HES

mkdir /home/ROM/Public
mkdir /home/ROM/Privé
mkdir /home/ROM/ingénierie
chown -R ROM:ING /home/ROM

mkdir /home/ALD/Public
mkdir /home/ALD/Privé
mkdir /home/ALD/ingénierie
chown -R ALD:ING /home/ALD

mkdir /home/RECH 
chown -R ROD:RECH /home/RECH

mkdir /home/DEV
chown -R NAD:DEV /home/DEV

mkdir /home/ING
chown -R HES:ING /home/ING
