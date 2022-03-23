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
 mdp=`< /dev/urandom tr -dc A-Z-a-z-0-9 | head -c12`
 echo "Mot de passe" $z = $mdp
sudo echo User $z: $mdp>> MDP
#sudo useradd -m -p $mdp $z
sudo useradd -m $z
echo $z:$mdp | chpasswd
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
 mdp=`< /dev/urandom tr -dc A-Z-a-z-0-9 | head -c12`
 echo "Mot de passe" $zz = $mdp
sudo echo User $zz: $mdp>> MDP
sudo useradd -m $zz
echo $zz:$mdp | chpasswd
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
 mdp=`< /dev/urandom tr -dc A-Z-a-z-0-9 | head -c12`
 echo "Mot de passe" $zzz = $mdp
sudo echo User $zzz: $mdp>> MDP
sudo useradd -m $zzz
echo $zzz:$mdp | chpasswd
sudo usermod -u $uid $zzz
echo "UID" $uid "pour" $zzz
echo " "
sudo chage $zzz -M 60 #changement de mot de passe user après 60 jours
#clear
done

# création user BIP avec attribution du mot de passe aléatoire et copie dans le fichier MDP
mdp=`< /dev/urandom tr -dc A-Z-a-z-0-9 | head -c12`
echo "Mot de passe" BIP = $mdp
sudo echo User BIP: $mdp>> MDP
sudo useradd -m BIP
echo BIP:$mdp | chpasswd
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

sudo mkdir /home/ROD/Public
sudo mkdir /home/ROD/Privé
sudo mkdir /home/ROD/Admin
sudo mkdir /home/ROD/Recherche
sudo chown -R ROD:RECH /home/ROD

sudo mkdir /home/SAF/Public
sudo mkdir /home/SAF/Privé
sudo mkdir /home/SAF/Recherche
sudo chown -R SAF:RECH /home/SAF

sudo mkdir /home/ALC/Public
sudo mkdir /home/ALC/Privé
sudo mkdir /home/ALC/Recherche
sudo chown -R ALC:RECH /home/ALC

sudo mkdir /home/JEL/Public
sudo mkdir /home/JEL/Privé
sudo mkdir /home/JEL/Recherche
sudo chown -R JEL:RECH /home/JEL

sudo mkdir /home/SOA/Public
sudo mkdir /home/SOA/Privé
sudo mkdir /home/SOA/Recherche
sudo chown -R SOA:RECH /home/SOA

sudo mkdir /home/NAD/Public
sudo mkdir /home/NAD/Privé
sudo mkdir /home/NAD/Admin
sudo mkdir /home/NAD/Développement
sudo chown -R NAD:DEV /home/NAD

sudo mkdir /home/LIT/Public
sudo mkdir /home/LIT/Privé
sudo mkdir /home/LIT/Développement
sudo chown -R LIT:DEV /home/LIT

sudo mkdir /home/KET/Public
sudo mkdir /home/KET/Privé
sudo mkdir /home/KET/Développement
sudo chown -R KET:DEV /home/KET

sudo mkdir /home/JAD/Public
sudo mkdir /home/JAD/Privé
sudo mkdir /home/JAD/Développement
sudo chown -R JAD:DEV /home/JAD

sudo mkdir /home/HES/Public
sudo mkdir /home/HES/Privé
sudo mkdir /home/HES/Admin
sudo mkdir /home/HES/ingénierie
sudo chown -R HES:ING /home/HES

sudo mkdir /home/ROM/Public
sudo mkdir /home/ROM/Privé
sudo mkdir /home/ROM/ingénierie
sudo chown -R ROM:ING /home/ROM

sudo mkdir /home/ALD/Public
sudo mkdir /home/ALD/Privé
sudo mkdir /home/ALD/ingénierie
sudo chown -R ALD:ING /home/ALD

sudo mkdir /home/RECH 
sudo chown -R ROD:RECH /home/RECH

sudo mkdir /home/DEV
sudo chown -R NAD:DEV /home/DEV

sudo mkdir /home/ING
sudo chown -R HES:ING /home/ING
