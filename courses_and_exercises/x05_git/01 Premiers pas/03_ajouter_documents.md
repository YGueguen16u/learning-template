# Ajouter des documents

Lorsque l'on crée un fichier, pour que git prenne en compte l'ajout de ce fichier dans le dépôt il faut utiliser la commande : 

```bash
git add nom_du_fichier
```

La commande d'ajout peut permettre d'ajouter plusieurs documents en même temps, voire de prendre en compte toutes les modifications qui ont été faites dans le répertoire.  
C'est possible en utilisant : 

```bash
git add .
```

Il faut néanmoins savoir que c'est une pratique à éviter. En effet le but va être d'historiser au mieux vos ajouts/modifications. Pour qu'en cas de besoin il soit plus simple dans le futur de comprendre ce qui a été fait dans votre répertoire.  
Plus tôt vous prendrez de bons réflexes avec git, mieux ce sera pour vos futures missions pour lesquelles vous utiliserez git.