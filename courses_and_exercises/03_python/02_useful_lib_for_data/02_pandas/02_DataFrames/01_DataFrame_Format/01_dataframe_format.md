## 1. Format d'un DataFrame

Un `DataFrame` se présente sous forme d'une **matrice** dont chaque ligne et chaque colonne porte un **indice**.  
En général, les colonnes sont indexées par leur nom.

Un `DataFrame` sert à stocker des **bases de données**.  
Les différentes **entrées** de la base (individus, animaux, objets, etc.) sont les différentes **lignes** et leurs **caractéristiques** sont les différentes **colonnes** :

| |Nom|Sexe|Taille|Age|
|---|---|---|---|---|
|**0**|Robert|M|174|23|
|**1**|Mark|M|182|40|
|**2**|Aline|F|169|56|

> - Le `DataFrame` ci-dessus regroupe des informations sur **3 individus** : le tableau possède donc **3 lignes**.
> 
> - Pour chacun de ces individus, nous disposons de **4 variables** (le nom, le sexe, la taille et l'âge) : le tableau possède donc **4 colonnes**.

La colonne contenant **les numérotations des lignes** est appelée l'**index** et ne se gère pas de la même façon qu'une colonne du dataset.

On peut laisser l'index par défaut (numérotation des lignes), indexer avec une des colonnes du `DataFrame` ou indexer avec une liste que l'on définit nous-même.

Exemple : Indexation par défaut (**numérotation des lignes**) :

| |Nom|Sexe|Taille|Age|
|---|---|---|---|---|
|**0**|Robert|M|174|23|
|**1**|Mark|M|182|40|
|**2**|Aline|F|169|56|

Exemple : Indexation par la colonne `'Nom'` :

| |Sexe|Taille|Age|
|---|---|---|---|
|**Robert**|M|174|23|
|**Mark**|M|182|40|
|**Aline**|F|169|56|

Exemple : Indexation par la liste `['personne_1', 'personne_2', 'personne_3']` :

| |Nom|Sexe|Taille|Age|
|---|---|---|---|---|
|**personne_1**|Robert|M|174|23|
|**personne_2**|Mark|M|182|40|
|**personne_3**|Aline|F|169|56|

Nous détaillerons plus loin comment définir l'index lors de la création d'un `DataFrame`.

La classe `DataFrame` présente plusieurs avantages par rapport à un array `Numpy` :

- Visuellement, un `DataFrame` est beaucoup plus **lisible** grâce à une indexation des colonnes et des lignes plus explicite.

- Au sein d'une même colonne les éléments sont du même type mais d'une colonne à l'autre, le **type des éléments peut varier**, ce qui n'est pas le cas des arrays `Numpy` qui ne supportent que des données de même type.

- La classe `DataFrame` contient davantage de méthodes pour la manipulation et le pré-traitement de bases de données, tandis que `NumPy` se spécialise plutôt dans le calcul optimisé.
