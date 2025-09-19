# Crontab

## 7.1 Qu'est ce que Crontab ?

Cron tire son nom du mot grec "Chronos", qui désigne le temps.

Il s'agit d'un processus qui exécute automatiquement des tâches selon un programme spécifique. C'est un ensemble de commandes qui sont utilisées pour exécuter des tâches régulières de planification. Crontab est également le nom du programme qui est utilisé pour modifier cette planification. Il est piloté par un fichier crontab, un fichier de configuration qui indique les commandes shell à exécuter périodiquement pour le programme spécifique.

Crontab est souvent utilisé pour l'automatisation de tâches telles que la gestion des logs, le nettoyage des données dans le cache, l'envoi d'emails de newsletter ou encore l'automatisation de votre script de scraping de données.

## 7.2 Syntaxe d'un Cron Job

Un Cron Job est une automatisation de tâches à réaliser. La syntaxe est la suivante :

```shell
* * * * * command/script
```

De gauche à droite :

- Le premier `*` correspond aux Minutes (0-59) ;
- Le deuxième `*` correspond aux Heures (0-23) ;
- Le troisième `*` correspond au Jour du mois (1-31) ;
- Le quatrième `*` correspond au Mois de l'année (1-12) ;
- Le cinquième `*` correspond au Jour de la semaine (0-6, du dimanche au samedi).

Pour spécifier plusieurs valeurs dans un champ, utilisez les symboles d'opérateur suivants :

- Astérisque (`*`) : Pour spécifier toutes les valeurs possibles pour un champ ;
- Tiret (`-`) : Pour spécifier une plage de valeurs ;
- La virgule (`,`) : Pour spécifier une liste de valeurs ;
- Le séparateur (`/`) : Pour spécifier une valeur d'étape.

### Exemple

Voici quelques exemples grâce à la syntaxe ci-dessus :

> Exécutez un Cron Job à 5h15 tous les jours.

```shell
15 5 * * * command/script
```

> Exécutez un Cron Job à 5h15 chaque 2eme jour du mois.

```shell
15 5 2 * * command/script
```

> Exécutez un Cron Job toutes les 5h.

```shell
0 */5 * * * command/script
```

> Exécutez un Cron Job chaque lundi et mercredi du mois de janvier et février.

```shell
0 0 * jan,feb mon,wed command/script
```

## 7.3 Mise en pratique

Créer le script `test.sh` suivant :

```shell
#!/bin/bash
echo "Cron Job" >> ~/cront.txt
```

> Ensuite, donnez les droits d'exécution au script `test.sh` via la consigne suivante :

```shell
chmod +x ~/test.sh
```

> À présent, exécutez la commande `crontab -e` pour ajouter un job.

> Insérez dans le fichier la ligne : `*/1 * * * * ~/test.sh` .

Le Cron Job défini exécute notre script à intervalle de 1 minute : Observez l'évolution du fichier `cront.txt` au fil des minutes.

## 7.4 Commandes usuelles

- `c` : Pour modifier le fichier crontab de l'utilisateur actuel ;
- `crontab -l` : Pour afficher le contenu du fichier crontab ;
- `crontab -u [nom d'utilisateur]` : Pour modifier le fichier crontab d'un autre utilisateur ;
- `crontab -r` : Pour supprimer le fichier crontab de l'utilisateur actuel ;
- `crontab -i` : Pour afficher une invite avant de supprimer le fichier crontab de l'utilisateur actuel.