```python
# (1) Charger les données contenues dans le fichier transactions.csv dans un DataFrame nommé transactions :
# On peut directement spécifier le nom de la colonne contenant les indices
transactions = pd.read_csv(filepath_or_buffer = 'transactions.csv',    # chemin du fichier
                           sep = ',',                    # caractère séparant les valeurs
                           header = 0,                   # numéro de la ligne contenant le nom des colonnes
                           index_col = 'transaction_id') # nom de la colonne qui indexe les entrées


# On peut aussi directement renseigner le numéro de la colonne qui indexe les entrées

transactions = pd.read_csv(filepath_or_buffer = 'transactions.csv',
                           sep = ',',
                           header = 0,
                           index_col = 0)  # numéro de la colonne qui indexe les entrées

# (2) Stocker les variables catégorielles dans un DataFrame nommé cat_vars
cat_vars = transactions[['cust_id', 'tran_date', 'prod_subcat_code', 'prod_cat_code', 'Store_type']]

# (3) Stocker les variables quantitatives dans un DataFrame nommé num_vars
num_vars = transactions[['Qty', 'Rate', 'Tax', 'total_amt']]

# (4) Afficher les 5 premières lignes de chaque DataFrame
cat_vars.head(5)
num_vars.head(5)

# (5) Stocker les transactions qui ont lieu dans un magasin de type "e-Shop" dans un DataFrame nommé transactions_eshop
transactions_eshop = transactions[transactions['Store_type'] == "e-Shop"]
# transactions_eshop = transactions.loc[transactions['Store_type'] == 'e-Shop']

# (6) Stocker les identifiants des clients et la date des transactions du DataFrame transactions_eshop dans un DataFrame nommé transactions_id_date
transactions_id_date = transactions[['cust_id', 'tran_date']]

# (7) Afficher les 5 premières lignes de transactions_id_date
transactions_id_date.head(5)

# (8) Extraction des transactions du client 268819
transactions_client_268819 = transactions.loc[transactions['cust_id'] == 268819]
transactions_client_268819.head()

# (9) Calcul du montant total des transactions
def somme_col(L):
    total = 0
    for amount in L:
        total += amount
    return total

print(somme_col(transactions_client_268819['total_amt']))

# (10) Utiliser la méthode describe du DataFrame transactions
print(transactions.describe())
# Le montant moyen de la transaction est de 2108€.
# La quantité maximale achetée est 5. 

# (11) Les variables quantitatives sont 'Qty', 'Rate', 'Tax' et 'total_amt'. Est-ce que par défaut les statistiques produites par la méthode describe ne sont calculées que sur les variables quantitatives ?
# Non

# (12) Afficher le nombre d'occurrences de chaque modalité que prend la variable Store_type à l'aide de la méthode value_counts
print(transactions['Store_type'].value_counts())

# (13) Quelle est la moyenne du montant des transactions dont le montant est positif ?
print(transactions[transactions['total_amt'] > 0].describe())
```


