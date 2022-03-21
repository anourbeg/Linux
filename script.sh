# création des groupes
sudo groupadd -g 2000 Recherches
sudo groupadd -g 3000 Dev
sudo groupadd -g 4000 ING
sudo groupadd -g 5000 ADMRECH
sudo groupadd -g 6000 ADMDEV
sudo groupadd -g 7000 ADMING

# création d'un dossier pour sauvegarder les mots de passes
sudo touch MDP
sudo chmod 1666 MDP
sudo echo Voici la liste des mots de passe>> MDP
sudo echo  >> MDP 

# boucle de création des users Recherches avec attribution des mots de passe aléatoires et copie dans le fichier MDP
uid=2000 
for z in ROD SAF ALC JEL SOA
 do
 ((++uid))
 mdp=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w12 | head -n1)
 echo "Mot de passe" $z = $mdp
sudo echo User $z: $mdp>> MDP
sudo useradd -m -p $mdp $z
sudo usermod -u $uid $z
echo "UID" $uid "pour" $z
echo " "
sudo chage $z -M 60
#clear
done


# boucle de création des users Dev avec attribution des mots de passe aléatoires et copie dans le fichier MDP
uid=3000
for zz in NAD LIT KET JAD
 do
 ((++uid))
 mdp=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w12 | head -n1)
 echo "Mot de passe" $zz = $mdp
sudo echo User $zz: $mdp>> MDP
sudo useradd -m -p $mdp $zz
sudo usermod -u $uid $zz
echo "UID" $uid "pour" $zz
echo " "
sudo chage $zz -M 60
#clear
done


# boucle de création des users ING avec attribution des mots de passe aléatoires et copie dans le fichier MDP
uid=4000
for zzz in HES ROM ALD
 do
 ((++uid))
 mdp=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w12 | head -n1)
 echo "Mot de passe" $zzz = $mdp
sudo echo User $zzz: $mdp>> MDP
sudo useradd -m -p $mdp $zzz
sudo usermod -u $uid $zzz
echo "UID" $uid "pour" $zzz
echo " "
sudo chage $zzz -M 60
#clear
done

# création user BIP avec attribution du mot de passe aléatoire et copie dans le fichier MDP
mdp=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w12 | head -n1)
echo "Mot de passe" BIP = $mdp
sudo echo User BIP: $mdp>> MDP
sudo useradd -m -p $mdp BIP
sudo usermod -u 8001 BIP
echo "UID" 8001 "pour" BIP
sudo chage BIP -M 60


#Place les users dans les groupes
sudo usermod -g Recherches -G ADMRECH ROD
sudo usermod -g Dev -G ADMDEV NAD
sudo usermod -g ING -G ADMING HES
sudo usermod -g BIP -aG ADMRECH,ADMDEV,ADMING BIP

for x in SAF ALC JEL SOA
do
 sudo usermod -g Recherches $x
done

for y in LIT KET JAD
do
 sudo usermod -g Dev $y
done

sudo usermod -g ING ROM
sudo usermod -g ING ALD