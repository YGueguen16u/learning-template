## Methods : 



## Attributes : 



## 7. Sélection de colonnes d'un `DataFrame`

L'extraction des colonnes d'un `DataFrame` est presque identique à l'extraction de données d'un dictionnaire.

Pour extraire une **colonne** d'un `DataFrame`, il suffit de renseigner **entre crochets** le **nom** de la colonne à extraire.  
Pour extraire **plusieurs** colonnes, il faut mettre entre crochets **la liste des noms** des colonnes à extraire (donc 1 deuxième paire de crochet est nécessaire pour la liste) :

```python
# Affichage de la colonne 'cust_id' 
print(transactions['cust_id'])

# Extraction des colonnes 'cust_id' et 'Qty' de transactions
cust_id_qty = transactions[["cust_id","Qty"]] 
```

`cust_id_qty` est un **nouveau** `DataFrame` ne contenant que les colonnes `'cust_id'` et `'Qty'`.  
L'affichage des 3 premières lignes de **`cust_id_qty`** donne :

|transactions_id|cust_id|Qty|
|---|---|---|
|**80712190438**|270351|-5|
|**29258453508**|270384|-5|
|**51750724947**|273420|-2|
  

Lorsque nous préparons un jeu de données pour l'exploiter plus tard, il est préférable de**séparer**les variables**catégorielles**des variables**quantitatives**:

- Une variable_**catégorielle**_est une variable qui contient des_**modalités**_ou_**catégories**_sans relation d'ordre. Par exemple, les variables**couleur préférée, pays et nationalité**sont des variables catégorielles  
    Les variables catégorielles du`DataFrame`transactions sont :`['cust_id', 'tran_date', 'prod_subcat_code', 'prod_cat_code', 'Store_type']`

- Une variable_**quantitative**_est une variable qui mesure une quantité, régie par une relation d'ordre permettant de comparer les éléments entre eux. Par exemple, les variables**taille, poids et âge**sont des variables quantitatives.  
    Les variables quantitatives de`transactions`sont :`['Qty', 'Rate', 'Tax', 'total_amt']`

Cette distinction est importante parce que certaines opérations basiques comme le calcul d'une moyenne n'a de sens que pour les variables quantitatives.

