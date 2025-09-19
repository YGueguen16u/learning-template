## 1. Filtrer un `DataFrame` avec les opérateurs binaires.

Filtrer consiste à **sélectionner** un sous-ensemble de **lignes** d'un DataFrame qui vérifient une **condition**.  
Le filtrage correspond à ce qu'on appelait jusqu'à maintenant l'indexation conditionnelle, mais le terme "filtrage" est celui qui est le plus utilisé dans la gestion de bases de données.

**Nous ne pouvons pas utiliser les opérateurs logiques** `and` et `or` pour filtrer sur plusieurs conditions.  
En effet, ces opérateurs créent de l'ambiguïté que pandas n'est pas capable de gérer pour filtrer les lignes.

Les opérateurs adaptés au filtrage sur plusieurs conditions sont les opérateurs **binaires** :

- L'opérateur 'et' : `&`.

- L'opérateur 'ou' : `|`.

- L'opérateur 'non' : `-`.

Ces opérateurs sont semblables aux opérateurs logiques mais leurs méthodes d'évaluation ne sont pas les mêmes.