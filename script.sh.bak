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

# Créations des mots de passes users aléatoires sur variables
mdpBIP=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w12 | head -n1)
mdpROD=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w12 | head -n1)
mdpSAF=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w12 | head -n1)
mdpALC=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w12 | head -n1)
mdpJEL=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w12 | head -n1)
mdpSOA=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w12 | head -n1)
mdpNAD=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w12 | head -n1)
mdpLIT=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w12 | head -n1)
mdpKET=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w12 | head -n1)
mdpJAD=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w12 | head -n1)
mdpHES=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w12 | head -n1)
mdpROM=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w12 | head -n1)
mdpALD=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w12 | head -n1)

# création des users
sudo useradd -m -p $mdpBIP BIP
sudo useradd -m -p $mdpROD ROD
sudo useradd -m -p $mdpSAF SAF
sudo useradd -m -p $mdpALC ALC
sudo useradd -m -p $mdpJEL JEL
sudo useradd -m -p $mdpSOA SOA
sudo useradd -m -p $mdpNAD NAD
sudo useradd -m -p $mdpLIT LIT
sudo useradd -m -p $mdpKET KET
sudo useradd -m -p $mdpJAD JAD
sudo useradd -m -p $mdpHES HES
sudo useradd -m -p $mdpROM ROM
sudo useradd -m -p $mdpALD ALD

# copie des mots de passes dans le fichier MDP
sudo echo User BIP: $mdpBIP>> MDP
sudo echo User ROD: $mdpROD>> MDP
sudo echo User SAF: $mdpSAF>> MDP
sudo echo User ALC: $mdpALC>> MDP
sudo echo User JEL: $mdpJEL>> MDP
sudo echo User SOA: $mdpSOA>> MDP
sudo echo User NAD: $mdpNAD>> MDP
sudo echo User LIT: $mdpLIT>> MDP
sudo echo User KET: $mdpKET>> MDP
sudo echo User JAD: $mdpJAD>> MDP
sudo echo User HES: $mdpHES>> MDP
sudo echo User ROM: $mdpROM>> MDP
sudo echo User ALD: $mdpALD>> MDP

#mettre ROD sur groupe primaire 2001 a voir