- **(a)** Importer le module `pandas` sous le nom `pd` et charger le fichier `"transactions.csv"` dans le `DataFrame` **transactions**. Les données sont séparées par des **virgules** dans le ficher CSV et la colonne contenant les identifiants est **`'transaction_id'`**.

- **(b)** Afficher les 10 premières lignes de `transactions.csv` avec la méthode `head`.

- **(c)** Combien y a-t-il de doublons dans le `DataFrame` transactions ?

Les transactions ont été enregistrées dans l'ordre antichronologique, c'est-à-dire que les **premières** lignes contiennent les transactions les plus **récentes** et les dernières lignes les transactions les plus anciennes.

- **(d)** Éliminer les doublons de la base de données en ne gardant que la première occurrence.

- **(e)** À l'aide des paramètres **`subset`** et **`keep`** de la méthode `drop_duplicates` de `transactions`, afficher la transaction **la plus récente** pour **chaque catégorie de `prod_cat_code`**. Pour cela, vous pourrez enlever tous les doublons de la colonne `prod_cat_code` en ne gardant que les premières occurrences.

- **(f)** Importer le module `numpy` sous le nom `np`.

- **(g)** Remplacer les modalités **`['e-Shop', 'TeleShop', 'MBR', 'Flagship store', np.nan]`** de la colonne **`Store_type`** par les modalités **`[1, 2, 3, 4, 0]`**. On en profitera pour remplacer les nan de la colonne **`prod_subcat_code`**.
    
    > La valeur `np.nan` est celle qui encode une valeur manquante. Nous allons remplacer cette valeur par `0`.
    

- **(h)** Convertir les colonnes **`Store_type`** et **`prod_subcat_code`** en type **`'int'`**.

- **(i)** Renommer les colonnes `Store_type`, `Qty`, `Rate` et `Tax` avec `store_type`, `qty`, `rate` et `tax`.

La colonne `tran_date` de `transactions` contient les dates des transactions au format **`('jour-mois-annee')`** (ex : `'28-02-2014'`).  
Ces dates sont de type chaîne de caractères : Il est impossible d'effectuer des statistiques sur cette variable pour l'instant.

Nous voudrions plutôt avoir dans **3 colonnes différentes** les jours, mois et années de chaque transaction.  
Ceci nous permettrait par exemple d'analyser et détecter des tendances dans les dates de transaction.

La date `'28-02-2014'` est une chaîne de caractères. Le jour, le mois et l'année sont séparées par un tiret **`'-'`**.  
La classe des chaînes de caractères dispose de la méthode **`split`** pour découper une chaîne sur un caractère spécifique :

```python
date = '28-02-2014'

# Découpage de la chaîne sur le caractère '-'
print(date.split('-'))
>>> ['28', '02', '2014']
```

Cette méthode renvoie une **liste** contenant les découpes de la chaîne sur le caractère spécifié.  
Ainsi, pour récupérer le jour, il suffit de sélectionner le **premier** élément du découpage. Pour récupérer le mois, il faut prendre le deuxième élément et pour l'année le troisième.

- **(j)** Définir une fonction **`get_day`** prenant en argument une chaîne de caractères et qui renvoie le premier élément de son découpage par le caractère `'-'`.

- **(k)** Définir les fonctions **`get_month`** et **`get_year`** qui font de même avec le deuxième et troisième élément du découpage.

- **(l)** Dans 3 variables **`days`**, **`months`** et **`years`**, stocker le résultat de la méthode **`apply`** sur la colonne **`tran_date`** appliquée avec les fonctions `get_day`, `get_month` et `get_year`. Comme ces fonctions s'appliquent élément par élément, il n'est pas nécessaire de spécifier l'argument **`axis`** dans la méthode `apply`.

- **(m)** Créer les colonnes `'day'`, `'month'` et `'year'` dans le `DataFrame` et y stocker les valeurs de `days`, `months` et `years`. La création d'une nouvelle colonne se fait simplement en la déclarant :
    
```python
# Création d'une nouvelle colonne 'day' avec les valeurs contenue dans days.
transactions['day'] = days
```
    
- **(n)** Afficher les 5 premières lignes de `transactions`.

- **(o)** À l'aide d'une fonction `lambda` appliquée sur `transactions`, créer une colonne **`'prod_cat'`** dans `transactions` contenant la concaténation des valeurs de `prod_cat_code` et `prod_subcat_code` séparées par un tiret `'-'`. N'oubliez pas de convertir les valeurs en chaînes de caractères.

L'affichage de cette colonne doit être le suivant :

```
transaction_id
80712190438     1-1
29258453508     3-5
51750724947     5-6
93274880719    6-11
51750724947     5-6
             ... 
94340757522    5-12
89780862956     1-4
85115299378     6-2
72870271171    5-11
77960931771    5-11
```

- **(p)** Lancer la cellule suivante pour réimporter `transactions`, enlever les doublons et renommer ses colonnes.

- **(q)** Combien de colonnes du `DataFrame` `transactions` contiennent des valeurs manquantes ?

- **(r)** Combien d'entrées de `transactions` contiennent des valeurs manquantes ? Vous pourrez suivre la méthode `any` avec la méthode `sum`.

- **(s)** Quelle colonne de `transactions` contient **le plus** de valeurs manquantes ?

- **(t)** Afficher les entrées de `transactions` qui contiennent au moins une valeur manquante dans les colonnes `'rate'`, `'tax'` et `'total_amt'`. Que remarquez-vous ?

- **(u)** Combien de colonnes du `DataFrame` `transactions` contiennent des valeurs manquantes ?

- **(v)** Combien d'entrées de `transactions` contiennent des valeurs manquantes ? Vous pourrez suivre la méthode `any` avec la méthode `sum`.

- **(w)** Quelle colonne de `transactions` contient **le plus** de valeurs manquantes ?

- **(x)** Afficher les entrées de `transactions` qui contiennent au moins une valeur manquante dans les colonnes `'rate'`, `'tax'` et `'total_amt'`. Que remarquez-vous ?

- **(y)** Remplacer les valeurs manquantes de la colonne **`prod_subcat_code`** de `transactions` par `-1`.

- **(z)** Déterminer **la modalité la plus fréquente** (le mode) de la colonne **`store_type`** de `transactions`.

- **(aa)** Remplacer les valeurs manquantes de la colonne `store_type` par cette modalité. On accède à la valeur de cette modalité **à l'indice 0** de la `Series` renvoyée par `mode`.

- **(ab)** Vérifier que les colonnes `prod_subcat_code` et `store_type` de `transactions` ne contiennent plus de valeurs manquantes.

Les données de transactions pour lesquelles le montant de la transaction n'est pas renseigné ne nous sont pas intéressantes. Pour cette raison :

- **(ac)** Supprimer les entrées de `transactions` pour lesquelles les colonnes **`rate`**, **`tax`** et **`total_amt`** sont **simultanément** vides.

- **(ad)** Vérifier que les colonnes de `transactions` **ne contiennent plus** de valeurs manquantes.


```python
# Importation des données
transactions = pd.read_csv("transactions.csv", sep =',', index_col = "transaction_id")

# Suppression des doublons
transactions = transactions.drop_duplicates(keep = 'first')

# Changement de nom des colonnes
new_names =  {'Store_type' : 'store_type',
              'Qty'        : 'qty',
              'Rate'       : 'rate',
              'Tax'        : 'tax'}

transactions = transactions.rename(new_names, axis = 1)

transactions.head()
```

```python
# Importation du module pandas sous le nom pd
import pandas as pd
import numpy as np

# Chargement de la base transactions
transactions = pd.read_csv("transactions.csv", sep =',', index_col = "transaction_id")

# Affichage des 10 premières lignes de transactions
transactions.head(10)

# Dénombrement des doublons
doublons = transactions.duplicated().sum()
print(f"Il y a {doublons} doublons dans transactions.")

transactions = transactions.drop_duplicates(
    keep = 'first'
)

transactions.drop_duplicates(
    subset = ['prod_cat_code'],
    keep = 'first'
)

# Dénombrement des doublons
doublons = transactions.duplicated().sum()
print("Il y a", doublons, "doublons dans transactions.")

# - Si vous vous trompez dans le prochain exercice, vous pouvez réimporter et effectuer le prétraitement des exercices précédents en lançant la cellule suivante :

# Importation des données
# transactions = pd.read_csv("transactions.csv", sep =',', index_col = "transaction_id")

# Suppression des doublons
# transactions = transactions.drop_duplicates(keep = 'first')


to_replace_mod = ['e-Shop', 'TeleShop', 'MBR', 'Flagship store',  np.nan]
value_mod = [1, 2, 3, 4, 0]

# Remplacement des modalités
transactions = transactions.replace(
    to_replace = to_replace_mod,
    value = value_mod
)

new_types = {
    'Store_type' : 'int',
    'prod_subcat_code' : 'int'
}

# Conversion des types des colonnes
transactions = transactions_new.astype(new_types)

# Changement de nom des colonnes
new_col = {
    'Store_type' : 'store_type',
    'Qty' : 'qty',
    'Rate' : 'rate',
    'Tax' : 'tax'
}

transactions = transactions_new.rename(new_col, axis = 1)

# Affichage des premières lignes de transactions
transactions.head(10)

# Définition des fonctions à appliquer à la colonne 'tran_date'
def get_day(date : str):
    return date.split("-")[0]
    
def get_month(date : str):
    return date.split("-")[1]

def get_year(date : str):
    return date.split("-")[2]

days = transactions['tran_date'].apply(get_day)
month = transactions['tran_date'].apply(get_month)
year = transactions['tran_date'].apply(get_year)

transactions['day'] = days
transactions['month'] = month
transactions['year'] = year

# Affichage des premières lignes de transactions
transactions.head()

# Affichage des premières lignes de transactions
transactions.head(5)

transactions['prod_cat'] = (
    transactions
    # Convertit d'abord en string car prod_cat_code et prod_subcat_code sont des int 
    # => concaténation de string avec "-" va renvoyer une erreur
    .astype(str)
    # Applique la fonction de concaténation sur chaque ligne
    .apply(
        lambda row : (
            row['prod_cat_code']+
            "-"+
            row['prod_subcat_code']
        ),
        axis = 1
    )
)

print(transactions['prod_cat'])

colonnes_na = transactions.isna().any(axis = 0)

print(colonnes_na.sum(), "colonnes de transactions contiennent des NANs. \n")

# Quelles sont les lignes qui contiennent des NANs
lignes_na = transactions?isna().any(axis = 1)
                        
print(lignes_na.sum(), "lignes de transactions contiennent des NANs. \n")

# Nombre de NANs par colonne
colonnes_nbna = transactions.isna().sum(axis = 0)

print("La colonne contenant le plus de NANs est:", colonnes_nbna.idxmax())

# Affichage des 10 premières entrées contenant au moins un NAN dans 'rate', 'tax' ou 'total_amt'
transactions.loc[transactions[['rate', 'tax', 'total_amt']].isna().any(axis = 1)].head(10)

# Les trois variables sont toujours manquantes ensembles.

# On remplace les NANs de 'prod_subcat_code' par -1
transactions['prod_subcat_code'] = transactions['prod_subcat_code'].fillna(-1)

# On détermine le mode de 'store_type'
store_type_mode = transactions['store_type'].mode()
print("La modalité la plus fréquente de 'store_type' est:", store_type_mode[0])

# On remplace les NANs de 'store_type' par son mode
transactions['store_type'] = transactions['store_type'].fillna(transactions['store_type'].mode()[0])

# On vérifie que ces deux colonnes ne contiennent plus de NANs
transactions[['prod_subcat_code', 'store_type']].isna().sum()

transactions = transactions.dropna(axis = 0, how = 'all', subset = ['rate', 'tax', 'total_amt'])

transactions.isna().sum(axis = 0)
```
