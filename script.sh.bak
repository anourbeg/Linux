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

# boucle de création des users avec attribution des mots de passe aléatoires et copie dans le fichier MDP
for i in BIP ROD SAF ALC JEL SOA NAD LIT KET JAD HES ROM ALD 
do
 mdp=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w12 | head -n1)
 echo "Mot de passe" $i = $mdp
sudo echo User $i: $mdp>> MDP
sudo useradd -m -p $mdp $i

done

#mettre ROD sur groupe primaire 2001 a voir