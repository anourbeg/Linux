#!/bin/bash

# création des groupes
sudo groupadd -g 2000 RECH
sudo groupadd -g 3000 DEV
sudo groupadd -g 4000 ING
sudo groupadd -g 5000 ADMRECH
sudo groupadd -g 6000 ADMDEV
sudo groupadd -g 7000 ADMING
sudo groupadd -g 8000 DIRECTION

# création d'un fichier pour sauvegarder les mots de passes users
sudo touch MDP
sudo chmod 1666 MDP
sudo echo Voici la liste des mots de passe>> MDP
sudo echo  >> MDP 

# boucle création des users RECH + attribution des mots de passe aléatoires + copie dans le fichier MDP + créations directories + attribution des droits aux directories
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
sudo chage $z -M 60 #changement de mot de passe user après 60 jours
sudo mkdir /home/$z/Public #création du dossier Public chez les users
sudo mkdir /home/$z/Privé #création du dossier Privé chez les users
sudo mkdir /home/$z/Recherche #création du dossier Recherche chez les users
sudo chown -R $z:RECH /home/$z
sudo chmod 1770 /home/$z/Recherche
sudo chmod 1700 /home/$z/Privé
sudo chmod 1755 /home/$z/Public
sudo chmod 1755 /home/$z
#clear
done

# boucle création des users DEV + attribution des mots de passe aléatoires + copie dans le fichier MDP + créations directories + attribution des droits aux directories
uid=3000

for zz in NAD LIT KET JAD
 do
 ((++uid))
mdp=`< /dev/urandom tr -dc A-Z-a-z-0-9 | head -c12`
sudo echo User $zz: $mdp>> MDP
sudo useradd -m $zz
echo $zz:$mdp | chpasswd
sudo usermod -u $uid $zz
sudo chage $zz -M 60 #changement de mot de passe user après 60 jours
sudo mkdir /home/$zz/Public #création du dossier Public chez les users
sudo mkdir /home/$zz/Privé #création du dossier Privé chez les users
sudo mkdir /home/$zz/Developpement #création du dossier Recherche chez les users
sudo chown -R $zz:DEV /home/$zz
sudo chmod 1770 /home/$zz/Developpement
sudo chmod 1700 /home/$zz/Privé
sudo chmod 1755 /home/$zz/Public
sudo chmod 1755 /home/$zzcd
sudo mkdir /home/$zz/Recherche #création du dossier Recherche chez les users
sudo chown -R $zz:DEV /home/$zz
#clear
done

# boucle création des users ING + attribution des mots de passe aléatoires + copie dans le fichier MDP + créations directories + attribution des droits aux directories
uid=4000

for zzz in HES ROM ALD
 do
 ((++uid))
mdp=`< /dev/urandom tr -dc A-Z-a-z-0-9 | head -c12`
sudo echo User $zzz: $mdp>> MDP
sudo useradd -m $zzz
echo $zzz:$mdp | chpasswd
sudo usermod -u $uid $zzz
sudo chage $zzz -M 60 #changement de mot de passe user après 60 jours
sudo mkdir /home/$zzz/Public #création du dossier Public chez les users
sudo mkdir /home/$zzz/Privé #création du dossier Privé chez les users
sudo mkdir /home/$zzz/Ingenierie #création du dossier Recherche chez les users
sudo chown -R $zzz:ING /home/$zzz
sudo chmod 1770 /home/$zzz/Ingenierie
sudo chmod 1700 /home/$zzz/Privé
sudo chmod 1755 /home/$zzz/Public
sudo chmod 1755 /home/$zzz
sudo mkdir /home/$zzz/Recherche #création du dossier Recherche chez les users
sudo chown -R $zzz:DEV /home/$zzz
#clear
done

# création user BIP avec attribution du mot de passe aléatoire + copie dans le fichier MDP + attribution des droits à /home/bip
mdp=`< /dev/urandom tr -dc A-Z-a-z-0-9 | head -c12`
sudo echo User BIP: $mdp>> MDP
sudo useradd -m BIP
echo BIP:$mdp | chpasswd
sudo usermod -u 8001 BIP
echo "UID" 8001 "pour" BIP
sudo chage BIP -M 60 #changement de mot de passe user après 60 jours
sudo chmod 1755 /home/BIP

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

#création dans /home/$chefs_de_services des directories Admin avec récursivité + droits 770 pour lecture et écriture
sudo mkdir /home/ROD/Admin
sudo chown -R ROD:ADMRECH /home/ROD/Admin
sudo chmod 1770 /home/ROD/Admin

sudo mkdir /home/NAD/Admin
sudo chown -R NAD:ADMDEV /home/NAD/Admin
sudo chmod 1770 /home/NAD/Admin

sudo mkdir /home/HES/Admin
sudo chown -R HES:ADMING /home/HES/Admin
sudo chmod 1770 /home/HES/Admin

#création dans /home des directories des 3 départements avec récursivité + droits 770 pour lecture et écriture
sudo mkdir /home/RECH 
sudo chown -R ROD:RECH /home/RECH
sudo chmod 1770 /home/RECH

sudo mkdir /home/DEV
sudo chown -R NAD:DEV /home/DEV
sudo chmod 1770 /home/DEV

sudo mkdir /home/ING
sudo chown -R HES:ING /home/ING
sudo chmod 1770 /home/ING
clear
echo "Opération terminée voici les modifications : "
sudo ls -lh /home
echo " "
sudo cat MDP
echo " "
echo "Les mots de passes sont cryptés :"
sudo cat /etc/shadow | egrep 'ROD|SAF|ALC|JEL|SOA|NAD|LIT|KET|JAD|HES|ROM|ALD|BIP'
echo " "
echo "UID et goupes des Users :"
for user in ROD SAF ALC JEL SOA NAD LIT KET JAD HES ROM ALD BIP
do
 sudo id $user 
done
echo " "
