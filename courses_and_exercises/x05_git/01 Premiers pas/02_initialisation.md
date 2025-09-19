# Initialisation

Nous allons à présent voir les commandes principales de git et nous rentrerons au fil du cours dans les détails de celles-ci.

Il faut avant tout créer un répertoire de travail. Une fois cette étape faite, il suffit de rentrer dans ce répertoire et d'utiliser la commande `git init` pour l'initialisation du dépôt en local.

```shell
mkdir repo
cd repo
git init
```

A la suite de cette commande, git crée un répertoire caché nommé `.git` . Pour rappel vous pouvez lister tous les éléments (y compris les éléments cachés) avec la commande `ls -a`. Vous pouvez rentrer dans le répertoire et faire un `ls`.

```shell
ls -a
cd .git
ls
```

C'est dans ce répertoire que vont être stockées toutes les données relatives à la création et modification d'éléments dans votre répertoire de travail. Ne prêtez pas forcément attention à ce qu'il y a dans ce répertoire, comprenez qu'il permet le bon fonctionnement de git.