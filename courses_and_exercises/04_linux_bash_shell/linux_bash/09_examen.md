## Examen

Cet examen se décompose en 2 exercices :

- Le premier porte sur le langage bash (Obligatoire pour valider le module)
- Le second porte sur l'outil jq (Optionnelle)

### 9.1 Examen : Bash - OBLIGATOIRE

#### Mise en place de l'API

Dans ce cours, nous avons vu comment fonctionne un système Linux. Nous aurions pu aller encore plus en détail mais nous avons construit la base pour la suite du parcours. Suivez les instructions suivantes pour réaliser l'exercice.

Exercice à réaliser _obligatoirement_ sur la machine Linux mise à votre disposition.

> Connectez vous à votre machine et exécutez la commande suivante pour récupérer l'API

```shell
wget --no-cache https://dst-de.s3.eu-west-3.amazonaws.com/bash_fr/api.tar
```

Vous avez maintenant un fichier d'extension `.tar`. Il s'agit simplement d'une archive à la manière d'un fichier compressé `zip`, mais spécifique à Linux. Pour manipuler ce fichier, nous passons par la commande `tar` (pour _tape archiver_). Pour tous les formats à base de tar, vous verrez que les options de tar sont les mêmes :

- c : crée l'archive.
- x : extrait l'archive
- f : utilise le fichier donné en paramètre
- v : active le mode verbeux.

> Décompressez l'archive à l'aide de la commande suivante :

```shell
tar -xvf api.tar
```

L'extrait de l'archive vous dévoile le script _api_

> Lancez le script `api` après avoir donné les droits d'exécution :

```shell
chmod +x api
./api &
```

Notre API tourne maintenant en `localhost` (0.0.0.0) sur le port 5000.

Il est tout à fait possible de faire tourner l'API sans la mettre en arrière-plan mais l'exécution de cette dernière vous bloquera toute manipulation sur votre VM. Il faudra alors ouvrir un 2nd terminal et il faudra vous reconnecter à la VM et travailler avec le 2nd terminal uniquement.

Cette API nous dévoile les ventes par minutes du plus gros revendeurs de cartes graphiques sur les modèles rtx3060, rtx3070, rtx3080, rtx3090 et rx6700. Il est possible de récupérer ces informations à l'aide de la commande **cURL**. Toutefois, il se peut que vous n'ayez pas cURL sur votre machine, pour remédier à cela, nous utilisons `apt` sur Linux.

#### Commande apt

`apt` est un gestionnaire de paquets qui contiennent différents logiciels que vous pouvez installer assez facilement avec une seule ligne de code. Pour ce faire, nous pouvons faire comme suit :

```bash
apt install software_name
```

Dans les anciennes versions d'Ubuntu, vous aviez besoin d'utiliser `apt-get` au lieu de `apt`. Dans la plupart des cas, vous avez besoin de `sudo` pour forcer les droits d'installation d'un logiciel.

Pour vous assurer que les paquets sont à jour, vous pouvez utiliser `sudo apt update` . Pour mettre à jour les logiciels, vous pouvez utiliser `sudo apt upgrade` . Vous pouvez ajouter ou supprimer certains paquets et supprimer complètement un logiciel utilisant la fonction `apt purge`.

> Installez `curl` avec `apt`.

```shell
sudo apt-get update

sudo apt-get install curl
```

Maintenant que nous avons `curl`, expliquons l'outil.

#### Commande curl

cURL, qui signifie client URL est un outil de ligne de commande pour le transfert de fichiers avec une syntaxe URL. Il prend en charge un certain nombre de protocoles (HTTP, HTTPS, FTP, et bien d'autres). HTTP/HTTPS en fait un excellent candidat pour interagir avec les APIs.

On peut, par exemple, récupérer les ventes de RTX 3060 à l'aide de la commande suivante.

```shell
curl "http://0.0.0.0:5000/rtx3060"
```

> Créez un dossier exam_NOM ou NOM est votre nom de famille.

> Ajoutez un dossier nommé exam_bash

> Créez à l'intérieur du dossier exam_bash un script bash nommé `exam.sh` dont les droits d’exécution sont `-rwx---r-x`.

> Le script bash devra récupérer les chiffres correspondant au ventes des différentes carte graphique et écrire les information dans un fichier `sales.txt` sous la forme :

```txt
Date de scraping
rtx3060:Nb de vente
rtx3070:Nb de vente
...

Voici un exemple de fichier sales.txt:

Thu Apr  1 00:05:01 UTC 2021
rtx3060:18
rtx3070:20
rtx3080:20
rtx3090:2
rx6700:12
Thu Apr  1 00:06:01 UTC 2021
rtx3060:6
rtx3070:15
rtx3080:15
rtx3090:1
rx6700:15
...
...
```

Pour récupérer la date actuelle et l'écrire dans le fichier, introduisez la ligne suivante dans votre examen:

```bash
echo "$(date)" >> sales.txt
```

Contrainte : utilisation d'une `fonction` et d'une `boucle` (for ou while) obligatoire.

> Créez un Cron Job qui exécute votre script toutes les minutes de 7 heures à 21 heures durant les mois de Mars, Juin et Novembre, du lundi au vendredi (copier le Cron Job dans un fichier cron.txt dans le dossier)

#### Rendu : Bash

On a donc les fichiers et dossiers suivants :

```txt
exam_NOM/exam_bash/exam.sh
exam_NOM/exam_bash/sales.txt
exam_NOM/exam_bash/cron.txt
```

Plus qu'un exercice à faire pour valider ce module !

### 9.2 Examen : JQ - OPTIONNEL

#### Mise en place

Vous rentrerez les commandes dans un fichier exécutable (avec le droit d'exécution +x) `exam_jq.sh`. Afin de valider l'exercice, vous devez rendre le fichier `exam_jq.sh` ainsi qu'un fichier `res_jq.txt` alimenté à l'aide de la commande `./exam_jq.sh > res_jq.txt`. N'oubliez pas qu'un être humain corrigera vos fichiers, pensez donc à bien présenter vos résultats dans vos 2 fichiers.

> Créez dans votre dossier exam_NOM, le dossier exam_jq

> Rendez-vous dans celui-ci, et créez un fichier `exam_jq.sh` comme ceci :

```bash
#!/bin/bash

echo "1. Énoncé de la question 1"
<commande pour répondre>
echo "Commande : <commande pour répondre>"
echo "Réponse : réponse de la question 1 si demandé"
echo -e "\n---------------------------------\n"
...

echo "n. Énoncé de la question n"
<commande pour répondre>
echo "Commande : <commande pour répondre>"
echo "Réponse : réponse de la question n si demandé"
echo -e "\n---------------------------------\n"
```

- : placez la commande liée à la question afin d'avoir le résultat de la commande dans le fichier `res_jq.txt`.

Remplissez les champs selon les questions évidemment. La réponse n'est pas le résultat du code mais votre interprétation de celui-ci.

#### Questions

Voici le fichier json qui va servir pour la réalisation de l'examen:

```bash
wget https://dst-de.s3.eu-west-3.amazonaws.com/bash_fr/people.json
```

Seules les questions 1, 2 et 4 attendent une Réponse interprétée.

1. Affichez le nombre d'attributs par document ainsi que l'attribut name. Combien y a-t-il d'attribut par document ? N'affichez que les 12 premières lignes avec la commande head (notebook #2).
    
2. Combien y a-t-il de valeur "unknown" pour l'attribut "birth_year" ? Utilisez la commande tail afin d'isoler la réponse.
    
3. Affichez la date de création de chaque personnage et son nom. La date de création doit être de cette forme : l'année, le mois et le jour. N'affichez que les 10 premières lignes. (Pas de Réponse attendue)
    
4. Certains personnages sont nés en même temps. Retrouvez toutes les pairs d'ids (2 ids) des personnages nés en même temps.
    
5. Renvoyez le numéro du premier film (de la liste) dans lequel chaque personnage a été vu suivi du nom du personnage. N'affichez que les 10 premières lignes. (Pas de Réponse attendue)
    

#### Bonus

Ajoutez cette commande pour séparer la partie obligatoire de la partie optionnelle.

```bash
echo -e "\n----------------BONUS----------------\n"
```

Aucune Réponse n'est demandée.

Enregistrez chacune des commandes dans des fichiers au format : people_<numéro_de_la_question>.json Ces fichiers doivent se trouver dans un dossier bonus/.

N'ajoutez rien au fichier `res_jq.txt`. Vous devez faire la redirection directement dans le fichier `exam_jq.sh`.

Les questions sont à réaliser depuis le fichier créé à la question précédente, sauf pour la question 6.

6. Supprimez les documents lorsque l'attribut height n'est pas un nombre.
    
7. Transformer l'attribut height en nombre.
    
8. Ne renvoyez que les personnages dont la taille est entre 156 et 171.
    
9. Renvoyez le plus petit individu de `people_8.json` et affichez cette phrase en une seule commande :` "<nom_du_personnage> is <taille> tall"` Renvoyez la commande dans un fichier `people_9.txt` et non `.json`.
    

#### Rendu : JQ

Nous avons les dossiers et fichiers suivants :

- exam_NOM/exam_jq/exam_jq.sh
- exam_NOM/exam_jq/res_jq.txt
- `exam_NOM/exam_jq/bonus/people_<6 à 9>.<json ou txt>`

#### Rendu final

> Créez une archive exam_NOM.tar

```bash
tar -cvf exam_NOM.tar exam_NOM
```

### Commande scp

La commande `scp` permet de transférer de manière sécurisée un fichier ou une archive (les dossiers ne sont pas transférables) via une connexion SSH.

Vous pouvez télécharger votre archive en exécutant la commande suivante `sur un terminal de votre propre machine`.

```shell
scp -i "data_enginering_machine.pem" ubuntu@VOTRE_IP:~/exam_NOM.tar .
```

Plusieurs détails concernant la commande ci-dessus:  
  
- Lorsque vous ouvrez votre terminal sur votre ordinateur local pour transférer votre archive depuis la VM, précisez le chemin absolu vers votre fichier data_enginering_machine.pem  
  
- Votre archive sera téléchargée dans le même dossier où se trouve votre fichier data_enginering_machine.pem

Une fois que vous avez téléchargé votre archive sur votre machine locale, vous pouvez l'envoyer en uploadant via l'onglet `Mes Exams`.