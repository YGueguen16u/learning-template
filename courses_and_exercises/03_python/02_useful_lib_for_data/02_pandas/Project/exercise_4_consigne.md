- **(a)** Afficher les 5 premières lignes du `DataFrame` `transactions`.

- **(b)** À partir de **`transactions`**, créer un `DataFrame` nommé **`e_shop`** contenant uniquement les transactions effectuées dans les magasins de type **`'e-Shop'`** avec un montant total **supérieur** à 5000 (colonnes `'store_type'` et `'total_amt'`).

- **(c)** De même, créer un `DataFrame` nommé **`teleshop`** qui contient les transactions effectuées dans les magasins de type **`'TeleShop'`** avec un montant total de plus de 5000.

- **(d)** Lequel des deux types de magasin compte le plus de transactions supérieures à 5000€ ?

- **(e)** Importer dans deux `DataFrames` nommés respectivement **`customer`** et **`prod_cat_info`** les données contenues dans les fichiers **`'customer.csv'`** et **`'prod_cat_info.csv'`**.

- **(f)** Les colonnes `Gender` et `city_code` de **`customer`** contiennent deux valeurs manquantes chacune. Les remplacer par leur mode à l'aide des méthodes `fillna` et `mode`.

- **(g)** Séparer les variables du `DataFrame` **`transactions`** en deux avec la moitié des variables dans un `DataFrame` nommé **`part_1`** et la deuxième moitié dans un `DataFrame` nommé **`part_2`**.

- **(h)** Reconstituer **`transactions`** dans un `DataFrame` nommé **`union`** en concaténant **`part_1`** et **`part_2`**.

- **(i)** Que se passe-t-il si on concatène `part_1` et `part_2` en renseignant l'argument **`axis = 0`** ?

Le `DataFrame` **`customer`** contient des informations sur des clients de la colonne `'cust_id'` de `transactions`.

La colonne **`'customer_Id'`** du `DataFrame` `customer` permettra de faire la jointure entre `transactions` et `customer`.  
Cela permettra d'enrichir le jeu de données **`transactions`** avec des informations supplémentaires.

- **(j)** À l'aide de la méthode `rename` et d'un dictionnaire, renommer la colonne **`'customer_Id'`** du `DataFrame` **`customer`** par **`'cust_id'`**.

- **(k)** En utilisant la méthode `merge`, effectuer la **jointure à gauche** entre les `DataFrames` **`transactions`** et **`customer`** sur la variable `'cust_id'`. Nommer le `DataFrame` créé **`fusion`**.

- **(l)** Est-ce que la fusion a produit des NaNs ?

- **(m)** Afficher les premières lignes de **`fusion`**. Quelles sont les nouvelles colonnes ?

La fusion s'est bien déroulée et n'a produit aucun NaNs. Par contre, l'index du `DataFrame` n'est plus la colonne **`'transaction_id'`** et a été réinitialisé avec l'index par défaut (`0`, `1`, `2`, ...).

- **(n)** Reprendre l'index de `transactions` et l'utiliser pour indexer `fusion`.

- **(o)** Lancer la cellule suivante pour instancier ces `DataFrames`.

```python
# Definition des dictionnaires
data_bateaux = {'nom_bateau'  : ['Julia', 'Siren', 'Sea Sons', 'Hercules', 'Cesar', 'Minerva'], 
                'couleur'    : ['bleu', 'vert', 'rouge', 'bleu', 'jaune', 'vert'],
                'numero_reservation': [2, 3, 6, 1, 4, 5],
                'nombre_reservations': [34, 10, 20, 41, 12, 16]}

data_clients = {'id_client' : [91, 154, 124, 320, 87, 22], 
                'nom_client'        : ['Marie', 'Anna', 'Yann', 'Lea', 'Marc', 'Yassine'],
                'id_reservation': [1, 2, 3, 7, 9, 10]}

# Creation des DataFrames
bateaux = pd.DataFrame(data_bateaux)
clients = pd.DataFrame(data_clients)
```

- **(p)** Renommer la colonne `'numero_reservation'` de `bateaux` en `'id_reservation'` grâce à la méthode `rename`.

- **(q)** Dans un `DataFrame` nommé **`bateaux_clients`**, faire la jointure à gauche entre `bateaux` et `clients`.

- **(r)** Définir la colonne `'nom_bateau'` comme index du `DataFrame` `bateaux_clients`.

- **(s)** À l'aide de la méthode `loc` qui permet d'indexer un `DataFrame`, trouver qui a réservé les bateaux `'Julia'` et `'Siren'`.

- **(t)** À l'aide de la méthode `isna` appliquée sur la colonne `nom_client`, déterminer les bateaux qui n'ont pas été réservés.

- **(u)** Le nombre de fois qu'un bateau a été réservé jusqu'à présent est renseigné par la colonne `'nombre_reservations'`. À l'aide de la méthode **`sort_values`**, déterminer le nom du client qui a réservé le bateau **bleu** ayant le plus de réservations à son actif.

- **(v)** À l'aide d'une opération `groupby`, déterminer pour chaque client à partir de la quantité d'items achetés dans une transaction (colonne **`qty`**) :
	- La quantité maximale.
	
	- La quantité minimale.
	
	- La quantité médiane.
	
	**Il faudra filtrer les transactions pour ne conserver que celles dont la quantité est positive.**  
	Pour cela, vous pourrez utiliser une **indexation conditionnelle** (`qty[qty > 0]`) de la colonne dans une fonction `lambda`.

Dans le fichier `covid_tests.csv`, nous disposons d'un jeu de données de 200 tests de la maladie COVID-19. Les colonnes de ce jeu de données sont les suivantes :

- **(w)** Charger le jeu de données contenu dans le fichier `covid_tests.csv`. Le caractère de séparation est `';'`.

- **(x)** Déterminer à l'aide de la fonction `pd.crosstab` le nombre de **Faux Négatifs** produits par ce test. Un faux négatif a lieu lorsque le test détermine que le patient n'est pas infecté alors qu'il l'est.

- **(y)** Quel est le taux de faux positifs du test ? Le taux de faux positifs correspond à la **proportion** de faux positifs par rapport à toutes les personnes saines. Il faudra donc normaliser les résultats.



