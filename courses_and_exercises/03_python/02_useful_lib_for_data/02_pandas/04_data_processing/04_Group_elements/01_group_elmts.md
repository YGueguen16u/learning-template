## 4. Grouper les éléments d'un `DataFrame`: méthodes `groupby`, `agg` et `crosstab`.

La méthode **`groupby`** permet de **grouper les lignes** d'un `DataFrame` qui partagent une valeur commune sur une colonne.

**Cette méthode ne renvoie pas un `DataFrame`.**  
L'objet renvoyé par la méthode `groupby` est un objet de la classe **`DataFrameGroupBy`**.

Cette classe permet de réaliser des opérations comme le calcul de statistiques (somme, moyenne, maximum, etc...) pour chaque modalité de la colonne sur laquelle on groupe les lignes.

La structure générale d'une **opération `groupby`** est la suivante :

- **_Séparation_** des données (**_Split_**).

- **_Application_** d'une fonction (**_Apply_**).

- **_Combinaison_** des résultats (**_Combine_**).

Exemple :  

On suppose que les bateaux du `DataFrame` `bateaux` sont tous identiques et ont le même âge.  
Nous voulons déterminer si la couleur d'un bateau a une influence sur son nombre de réservations. Pour cela, nous allons calculer pour chaque couleur le nombre moyen de réservations par bateau.

Il faut donc :

- **Séparer** les bateaux par couleur.

- **Calculer** la moyenne du nombre de réservations (Application de la fonction **`mean`**).

- **Combiner** les résultats dans un `DataFrame` pour les comparer facilement.

Ainsi, nous pouvons utiliser la méthode **`groupby`** suivie de la méthode **`mean`** pour obtenir le résultat :

  
![](https://assets-datascientest.s3-eu-west-1.amazonaws.com/train/pd_groupby.png)  

Toutes les méthodes statistiques usuelles (`count`, `mean`, `max`, etc...) peuvent s'utiliser en suffixe de la méthode `groupby`.  
Celles-ci s'effectueront uniquement sur les colonnes de type compatibles.

Il est possible de spécifier pour chaque colonne quelle fonction doit être utilisée à l'étape **_Application_** d'une opération `groupby`.  
Pour cela, on utilise la méthode **`agg`** de la classe `DataFrameGroupBy` en lui renseignant un **dictionnaire** où chaque **clé** est le **nom** d'une colonne et la **valeur** est la **fonction** à appliquer.

Exemple :  

Revenons au `DataFrame` `transactions` :

|transaction_id|cust_id|tran_date|prod_subcat_code|prod_cat_code|qty|rate|tax|total_amt|store_type|
|---|---|---|---|---|---|---|---|---|---|
|80712190438|270351|28-02-2014|1|1|-5|-772|405.3|-4265.3|e-Shop|
|29258453508|270384|27-02-2014|5|3|-5|-1497|785.925|-8270.92|e-Shop|
|51750724947|273420|24-02-2014|6|5|-2|-791|166.11|-1748.11|TeleShop|
|93274880719|271509|24-02-2014|11|6|-3|-1363|429.345|-4518.35|e-Shop|
|51750724947|273420|23-02-2014|6|5|-2|-791|166.11|-1748.11|TeleShop|

Nous voulons, **pour chaque client** (`cust_id`), déterminer pour la colonne `total_amt` le **minimum**, **maximum**, le **montant total dépensé**.  
Nous voulons aussi savoir dans **combien de types** de magasins différents le client a effectué une transaction (colonne `store_type`).

Nous pouvons effectuer ces calculs à l'aide d'une **opération `groupby`** :

- **Séparer** les transactions par l'**identifiant client**.

- Pour la colonne **`total_amt`**, calculer le minimum (`min`), maximum (`max`) et la somme (`sum`). Pour la colonne **`store_type`**, compter le **nombre de modalités prises** (`count`).

- **Combiner** les résultats dans un `DataFrame`.

Pour trouver le nombre de modalités prises par la colonne `store_type`, nous allons utiliser la fonction **`lambda`** suivante :

```python
import numpy as np

n_modalities = lambda store_type: len(np.unique(store_type))
```

- La fonction `lambda` doit prendre en argument une **colonne** et retourner un **nombre**.

- La fonction **`np.unique`** determine les modalités **uniques** qui apparaissent dans une séquence.

- La fonction **`len`** compte le nombre d'éléments dans une séquence.

Ainsi, cette fonction va nous permettre de déterminer le nombre de modalités uniques pour la colonne `store_type`.

Pour appliquer ces fonctions dans l'opération `groupby`, nous allons utiliser un dictionnaire dont les **clés** sont les **colonne**s à traiter et les **valeurs** les **fonctions** à utiliser.

```python
functions_to_apply = {
    # Les méthodes statistiques classiques peuvent être renseignées avec
    # chaines de caractères
    'total_amt' : ['min', 'max', 'sum'],
    'store_type' : n_modalities
}
```

Ce dictionnaire peut maintenant être utilisé avec la méthode **`agg`** :

```python
transactions.groupby('cust_id').agg(functions_to_apply)
```

Ce qui produit le `DataFrameGroupBy` suivant :

|cust_id|total_amt  <br>  <br>min|max|sum|store_type  <br>  <br><lambda>|
|---|---|---|---|---|
|**266783**|-5838.82|5838.82|3113.89|2|
|**266784**|442|4279.66|5694.07|3|
|**266785**|-6828.9|6911.77|21613.8|3|
|**266788**|1312.74|1927.12|6092.9 7|3|
|**266794**|-135.915|4610.06|27981.9|4|

Une autre manière de grouper et résumer des données est d'utiliser la fonction `crosstab` de `pandas` qui, comme son nom l'indique, sert à croiser les données des colonnes d'un `DataFrame`.

Elle permet de visualiser la **fréquence** d'apparition de **paires de modalités** dans un `DataFrame`.

Exemple :  

Dans le `DataFrame` `transactions`, nous voulons savoir quels sont les couples de catégorie et sous-catégories les plus fréquents (colonnes `prod_cat_code` et `prod_subcat_code`).

La fonction `crosstab` de pandas nous donne ce résultat en s'utilisant ainsi :

```python
colonne1 = transactions['prod_cat_code']
colonne2 = transactions['prod_subcat_code']
pd.crosstab(colonne1, colonne2)
```

Cette instruction produit le `DataFrame` suivant :

|prod_subcat_code  <br>  <br>prod_cat_code|-1|1|2|3|4|5|6|7|8|9|10|11|12|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|**1**|4|1001|0|981|958|0|0|0|0|0|0|0|0|
|**2**|4|934|0|1040|1005|0|0|0|0|0|0|0|0|
|**3**|11|0|0|0|1020|950|0|0|966|976|945|0|0|
|**4**|5|993|0|0|988|0|0|0|0|0|0|0|0|
|**5**|3|0|0|1023|0|0|984|1037|0|0|998|1029|962|
|**6**|5|0|1002|0|0|0|0|0|0|0|1025|1013|1057|

La case `(i, j)` du `DataFrame` résultat contient le nombre d'éléments du `DataFrame` ayant la modalité `i` pour la colonne 1 (`prod_cat_code`) et la modalité `j` pour la colonne 2 (`prod_cubcat_code`).

Ainsi, il est facile de déterminer par exemple que **les sous-catégories dominantes** de la catégorie **`4`** sont `1` et `4`.

L'argument **`normalize`** de `crosstab` permet d'afficher les fréquences sous forme de pourcentage.

Ainsi, l'argument **`normalize = 1`** normalise le tableau sur l'axis 1 c'est-à-dire sur chaque **colonne** :

```python
# On récupère l'année de la transaction
colonne1 = transactions['tran_date'].apply(lambda x: x.split('-')[2]).astype("int")

colonne2 = transactions['store_type']

pd.crosstab(colonne1,
            colonne2,
            normalize = 1)
```

Ce qui produit le `DataFrame` suivant :

|store_type  <br>  <br>tran_date|Flagship store|MBR|TeleShop|e-Shop|
|---|---|---|---|---|
|**2011**|0.291942|0.323173|0.283699|0.306947|
|**2012**|0.331792|0.322093|0.336767|0.322886|
|**2013**|0.335975|0.3115|0.332512|0.320194|
|**2014**|0.0402906|0.0432339|0.0470219|0.0499731|

Ce `DataFrame` nous permet de dire que **33.5975%** des transactions effectuées dans un **`'Flagship store'`** ont eu lieu en **2013**.

Inversement, en renseignant l'argument **`normalize = 0`**, on normalise le tableau sur chaque **ligne** :

|store_type  <br>  <br>tran_date|Flagship store|MBR|TeleShop|e-Shop|
|---|---|---|---|---|
|**2011**|0.191121|0.21548|0.182617|0.410781|
|**2012**|0.20096|0.198693|0.20056|0.399787|
|**2013**|0.205522|0.194074|0.2|0.400404|
|**2014**|0.173132|0.189215|0.198675|0.438978|

La normalisation par ligne nous permet de déduire que les transactions effectuées dans un **`'e-Shop'`** comptent pour **41.0781%** des transactions de l'année **2011**.