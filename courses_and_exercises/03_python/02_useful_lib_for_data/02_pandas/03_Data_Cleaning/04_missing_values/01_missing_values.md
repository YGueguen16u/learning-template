## 2. Gestion des valeurs manquantes

Une **valeur manquante** est soit :

- Une valeur non renseignée.

- Une valeur qui n'existe pas. En général, elles sont issues de calculs mathématiques n'ayant pas de solution (une division par zéro par exemple).

Une valeur manquante apparaît sous la dénomination **NaN** ("**N**ot **a** **N**umber") dans un `DataFrame`.

Dans cette partie, nous allons voir plusieurs méthodes pour :

- La **détection** des valeurs manquantes (méthodes `isna` et `any`).

- Le **remplacement** de ces valeurs (méthode `fillna`).

- La **suppression** des valeurs manquantes (méthode `dropna`).

Dans un des exercices précédents, nous avons utilisé la méthode `replace` de `transactions` pour remplacer les valeurs manquantes par `0`.  
Cette approche manque de rigueur et il ne faut pas procéder de cette façon en pratique.

Pour cette raison, nous allons réimporter la version brute de `transactions` pour annuler les étapes que nous avons faites dans les exercices précédents.
