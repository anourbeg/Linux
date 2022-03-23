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
sudo mkdir /home/$z/Public #création du dossier Public chez les users
sudo mkdir /home/$z/Privé #création du dossier Privé chez les users
sudo mkdir /home/$z/Recherche #création du dossier Recherche chez les users
sudo chown -R $z:RECH /home/$z
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
sudo mkdir /home/$zz/Public #création du dossier Public chez les users
sudo mkdir /home/$zz/Privé #création du dossier Privé chez les users
sudo mkdir /home/$zz/Recherche #création du dossier Recherche chez les users
sudo chown -R $zz:DEV /home/$zz
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
sudo mkdir /home/$zzz/Public #création du dossier Public chez les users
sudo mkdir /home/$zzz/Privé #création du dossier Privé chez les users
sudo mkdir /home/$zzz/Recherche #création du dossier Recherche chez les users
sudo chown -R $zzz:ING /home/$zzz
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

sudo mkdir /home/ROD/Admin
sudo mkdir /home/NAD/Admin
sudo mkdir /home/HES/Admin


sudo mkdir /home/RECH 
sudo chown -R ROD:RECH /home/RECH

sudo mkdir /home/DEV
sudo chown -R NAD:DEV /home/DEV

sudo mkdir /home/ING
sudo chown -R HES:ING /home/ING
