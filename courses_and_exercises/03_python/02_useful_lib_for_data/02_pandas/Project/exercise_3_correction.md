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
