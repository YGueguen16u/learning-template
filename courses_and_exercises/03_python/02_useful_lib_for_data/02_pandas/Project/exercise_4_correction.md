```python
import pandas as pd

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

### Gestion des NAs ###

# On remplace les NANs de 'prod_subcat_code' par -1
transactions['prod_subcat_code'] = transactions['prod_subcat_code'].fillna(-1).astype("int")

# On détermine le mode de 'store_type'
store_type_mode = transactions['store_type'].mode()

# On remplace les NANs de 'store_type' par son mode
transactions['store_type'] = transactions['store_type'].fillna(transactions['store_type'].mode()[0])

# Suppression des lignes dont 'rate', 'tax' et 'total_amt' ont toutes des valeurs manquantes
transactions = transactions.dropna(axis = 0, how = 'all', subset = ['rate', 'tax', 'total_amt'])

# Création de e_shop et teleshop
teleshop = transactions[(transactions['store_type'] == 'TeleShop') & (transactions['total_amt'] > 5000)]

e_shop = transactions[(transactions['store_type'] == 'e-Shop') & (transactions['total_amt'] > 5000)]

# Dénombrement des lignes des 2 DataFrame avec la fonction len. D'autres solutions existent.
print('Nombre de transactions à plus de 5000€ pour le e-shop :', len(e_shop['total_amt']))
print('Nombre de transactions à plus de 5000€ pour le TeleShop :', len(teleshop['total_amt']))

customer = pd.read_csv('customer.csv')
prod_cat_info = pd.read_csv('prod_cat_info.csv')

customer['Gender'] = customer['Gender'].fillna(customer['Gender'].mode()[0])
customer['city_code'] = customer['city_code'].fillna(customer['city_code'].mode()[0])

# Séparation du DataFrame transactions
part_1 = transactions[transactions.columns[:4]]
part_2 = transactions[transactions.columns[4:]]

# Reconstitution du DataFrame transactions par concaténation
union = pd.concat([part_1,part_2], axis = 1)

# Si on concatène en renseignant "axis = 0", on obtient un DataFrame dont la moitié des valeurs sont des NaNs
#
# Ceci est dû au fait que l'argument "axis = 0" force la fonction pd.concat à créer de nouvelles LIGNES
# dans part_1 mais elle n'arrive pas à les remplir correctement car part_1 et part_2 n'ont aucune colonne en commun.

# On renomme la colonne 'customer_Id' en 'cust_id' pour faire la fusion
customer = customer.rename(columns = {'customer_Id':'cust_id'})

# Jointure à gauche entre transactions et customer sur la colonne 'cust_id'
fusion = transactions.merge(right = customer, on = 'cust_id', how = 'left')

# La fusion n'a produit aucun NaN
fusion.isna().sum()

# Les colonnes DOB, Gender, city_code ont bien été ajoutées à transactions
fusion.head()

# On récupère l'index de transactions
new_index = transactions.index

# On définit le nouvel index de fusion
fusion = fusion.set_index(new_index)
fusion.head()

# On renomme la colonne 'numero_reservation'
bateaux = bateaux.rename(columns={'numero_reservation' : 'id_reservation'})

# On effectue la jointure à gauche entre bateaux et clients
bateaux_clients = bateaux.merge(clients, on = 'id_reservation', how = 'left')

# On définit la colonne 'nom_bateau' comme étant l'index de bateaux_clients
bateaux_clients = bateaux_clients.set_index("nom_bateau")

# Qui a réservé 'Julia' et 'Siren'?
print("Le client qui a réservé 'Julia' est:", bateaux_clients.loc['Julia', 'nom_client'])
print("Le client qui a réservé 'Siren' est:", bateaux_clients.loc['Siren', 'nom_client'])
print("\n")

# Quels bateaux n'ont pas été réservés?
bateaux_non_reserves = bateaux_clients[bateaux_clients['nom_client'].isna()]
print("Les bateaux qui n'ont pas été réservés sont:", [bateau for bateau in bateaux_non_reserves.index])

# Quel client a réservé le bateau BLEU ayant LE PLUS de réservations à son actif ?
bateau_bleu_le_plus_reserve = bateaux_clients[bateaux_clients['couleur']=='bleu'].sort_values(by = 'nombre_reservations', ascending = False).iloc[0]
print("Le client ayant reservé le bateau bleu avec le plus de réservations à son actif est :", bateau_bleu_le_plus_reserve['nom_client'])

# Quantité maximale
max_qty = lambda qty: qty[qty > 0].max()

# Quantité minimale
min_qty = lambda qty: qty[qty > 0].min()

# Quantité médiane
median_qty = lambda qty : qty[qty > 0].median()

# Définition du dictionnaire de fonctions à appliquer
functions_to_apply = {
    'qty' : [max_qty, min_qty, median_qty]
}

# Operation groupby
qty_groupby = transactions.groupby('cust_id').agg(functions_to_apply)

### Ou en une seule ligne :
### qty_groupby = transactions[transactions['qty'] > 0].groupby('cust_id').agg({'qty':['min', 'max', 'median']})

# Pour un meilleur affichage, on peut renommer les colonnes produite par le groupby
qty_groupby.columns.set_levels(['max_qty', 'min_qty', 'median_qty'], level=1, inplace = True)


# Affichage des premières lignes du DataframeGroupBy produit par l'opération groupby
qty_groupby.head()

# Chargement des données dans 'covid_tests.csv'
covid_df = pd.read_csv("covid_tests.csv", sep = ';', index_col = 'patient_id')
covid_df.head()


# Croisement des résultats des tests avec la réalité
pd.crosstab(covid_df['test_result'], 
            covid_df['infected'])

# Le nombre de faux négatifs est de 3

pd.crosstab(covid_df['test_result'], 
            covid_df['infected'],
            normalize = 1)

# Le taux de faux positifs est d'environ 5,6% contre environ 94,4% de vrais négatifs parmi les personnes saines


```