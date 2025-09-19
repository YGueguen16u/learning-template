# Faire un commit

On a mentionné plus haut le fait d'historiser vos ajouts/modifications de documents. Pour accomplir cette tâche, à la suite d'un ajout (git add), on doit faire un _commit_ c'est-à-dire enregistrer l'ajout ou la modification du document dans l'historique des modifications. On peut ajouter un message à nos _commits_ pour garder une trace commentée de toutes les modifications. On va donc faire un commit avec un commentaire intéressant et pertinent pour les utilisateurs grâce à la commande git `commit -m "le commentaire"`.

> Exemple de commentaires courts et explicites

```shell
git commit -m "ajout du fichier nom_du_fichier"
git commit -m "modification de la fonction nom_de_la_fonction"
git commit -m "ajout de documentation"
```

### Commit sur plusieurs lignes

Titre court et descriptif (50 caractères max)

Description détaillée des changements :
- Premier changement important
- Deuxième changement important
- Impact sur le reste du code

```shell 
git commit -m "Titre du commit" -m "Description détaillée
qui peut continuer sur
plusieurs lignes"
```

