Le **nettoyage des données** et la bonne **gestion des valeurs manquantes** (appelées **[NaN](https://en.wikipedia.org/wiki/NaN)** ou **NA**) sont deux étapes essentielles avant toute analyse sur une base de données.

L'objectif de ce notebook est de détailler chacune de ces deux étapes afin d'obtenir un `DataFrame` propre et facilement exploitable.  
En effet, les bases de données présentent très souvent ce genre de problèmes.

Pour cela, nous allons nous servir du `DataFrame` **`transactions`** importé dans l'exercice précédent.

## 1. Nettoyage d'un jeu de données

Dans cette partie nous allons introduire les méthodes de la classe `DataFrame` utiles au nettoyage d'un dataset. Ces méthodes peuvent se regrouper dans trois catégories différentes :

- **Gestion des doublons** (méthodes `duplicated` et `drop_duplicates`).

- **Modification des éléments** d'un `DataFrame` (méthodes `replace`, `rename` et `astype`).

- **Opérations** sur les valeurs d'un `DataFrame` (méthode `apply` et clause `lambda`).
