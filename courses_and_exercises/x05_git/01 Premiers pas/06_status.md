# Connaître le statut de son dépôt local

A tout moment, il est possible de connaître l'état du dépôt: grâce à la commande `git status`, git nous guide également sur les actions que l'on doit faire. Cette commande est extrêmement importante, il est conseillé pour bien prendre en main l'outil de toujours faire un `git status` avant et après chaque commande pour voir l'évolution de nos documents.

Lors de l'exécution de `git status`, si rien est à faire, on devrait avoir l'affichage suivant.

```bash
git status
``` 

```shell
On branch master

No commits yet

nothing to commit (create/copy files and use "git add" to track)
```

On comprend donc les informations qui vont nous être fournies à savoir: Sur quelle branche sommes nous (notion qui sera vue plus tard); si il y a des fichiers à ajouter; si il y a des fichiers à commiter.