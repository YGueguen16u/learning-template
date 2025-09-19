# Supprimer des documents

Lorsque l'on souhaite supprimer un fichier, pour que git prenne en compte la suppression de ce fichier dans le dépôt il faut utiliser la commande `git rm nom_du_fichier`. Comme pour l'ajout ou la modification d'un document avec `git add`, il faudra également enregistrer la suppression avec un _commit_.

```shell

git rm  "mon_fichier.txt"
git commit -m "suppression du fichier mon_fichier.txt"
```
