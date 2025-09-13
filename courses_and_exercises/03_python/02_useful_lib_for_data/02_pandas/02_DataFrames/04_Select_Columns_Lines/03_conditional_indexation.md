## Methods : 

## 9. Indexation Conditionnelle d'un `DataFrame`

Comme pour les arrays Numpy, nous pouvons utiliser **l'indexation conditionnelle** pour extraire les lignes d'un `Dataframe` qui vérifient une condition donnée.

Dans l'illustration suivante, nous sélectionnons les lignes du `DataFrame` `df` **pour lesquelles la colonne `col 2` vaut 3**.

  
![alt text](image.png)

Il existe deux syntaxes pour indexer conditionnellement un `DataFrame` :

```python
# On sélectionne les lignes du DataFrame df pour lesquelles la colonne 'col 2' vaut 3. 
df[df['col 2'] == 3]

df.loc[df['col 2'] == 3]
```

Si nous souhaitons **assigner** une nouvelle valeur à ces entrées, il faut absolument utiliser la méthode **`loc`**.  
En effet, l'indexation avec la syntaxe `df[df['col 2'] == 3]` ne renvoie qu'une **copie** de ces entrées et ne permet pas d'accéder à l'emplacement mémoire où se trouvent les données.

  

Le gérant des transactions répertoriées dans le `DataFrame` **`transactions`** souhaite avoir accès aux **identifiants** des clients ayant fait un achat **en ligne** (c'est-à-dire dans un `"e-Shop"`) ainsi que **la date de la transaction correspondante**.

Nous avons les informations suivantes concernant les colonnes de `transactions` :

|Nom de la colonne|Description|
|---|---|
|`'cust_id'`|Les **identifiants** des clients|
|`'Store_type'`|Le **type de magasin** où s'est faite la transaction|
|`'tran_date'`|La **date** des transactions|
- **(a)** Dans un `DataFrame` nommé **`transactions_eshop`**, stocker les transactions qui ont lieu dans un magasin de type `"e-Shop"`.

- **(b)** Dans un autre `DataFrame` nommé **`transactions_id_date`**, stocker les identifiants des clients et la date des transactions du `DataFrame` `transactions_eshop`.

- **(c)** Afficher les 5 premières lignes de `transactions_id_date`.

```python
transactions_eshop = transactions[transactions['Store_type'] == "e-Shop"]
# transactions_eshop = transactions.loc[transactions['Store_type'] == 'e-Shop']
transactions_id_date = transactions[['cust_id', 'tran_date']]

transactions_eshop.head()
transactions_id_date.head()
```


| |cust_id|tran_date|prod_subcat_code|prod_cat_code|Qty|Rate|Tax|total_amt|Store_type|
|---|---|---|---|---|---|---|---|---|---|
|transaction_id||||||||||
|---|---|---|---|---|---|---|---|---|---|
|80712190438|270351|28-02-2014|1.0|1|-5|-772.0|405.300|-4265.300|e-Shop|
|29258453508|270384|27-02-2014|5.0|3|-5|-1497.0|785.925|-8270.925|e-Shop|
|93274880719|271509|24-02-2014|11.0|6|-3|-1363.0|429.345|-4518.345|e-Shop|
|45649838090|273667|22-02-2014|11.0|6|-1|-1450.0|152.250|-1602.250|e-Shop|
|50076728598|269014|21-02-2014|8.0|3|-4|-581.0|244.020|-2568.020|e-Shop|

| |cust_id|tran_date|
|---|---|---|
|transaction_id|||
|---|---|---|
|80712190438|270351|28-02-2014|
|29258453508|270384|27-02-2014|
|51750724947|273420|24-02-2014|
|93274880719|271509|24-02-2014|
|51750724947|273420|23-02-2014|

À présent, le gérant voudrait avoir accès aux transactions effectuées par le client d'identifiant `268819`.

- **(d)** Dans un `DataFrame` nommé **`transactions_client_268819`**, stocker toutes les transactions dont l'identifiant du client est `268819`.

- **(e)** Une colonne d'un `DataFrame` peut être parcourue comme une liste dans une boucle `for`. À l'aide d'une boucle `for` sur la colonne `'total_amt`', calculer et afficher le montant total des transactions du client `268819`.

```python
# Extraction des transactions du client 268819
transactions_client_268819 = transactions.loc[transactions['cust_id'] == 268819]
transactions_client_268819.head()

# Calcul du montant total des transactions
def somme_col(L):
    total = 0
    for amount in L:
        total += amount
    return total

print(somme_col(transactions_client_268819['total_amt']))
```

| |cust_id|tran_date|prod_subcat_code|prod_cat_code|Qty|Rate|Tax|total_amt|Store_type|
|---|---|---|---|---|---|---|---|---|---|
|transaction_id||||||||||
|---|---|---|---|---|---|---|---|---|---|
|11878870074|268819|26-01-2014|10.0|5|-4|-1486.0|624.12|-6568.12|e-Shop|
|11878870074|268819|23-01-2014|10.0|5|4|1486.0|624.12|6568.12|e-Shop|
|22303224302|268819|19-12-2013|10.0|5|-2|-152.0|31.92|-335.92|Flagship store|
|22303224302|268819|11-12-2013|10.0|5|2|152.0|31.92|335.92|Flagship store|
|9987404340|268819|7-10-2013|10.0|5|1|1220.0|128.10|1348.10|e-Shop|

