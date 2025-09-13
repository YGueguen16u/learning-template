## Methods

- `value_counts`
- `describe`

## Attributes



## 10. Rapide étude statistique des données d'un `DataFrame`

La méthode **`describe`** d'un `DataFrame` retourne un résumé des statistiques descriptives (min, max, moyenne, quantiles,..) de ses variables **quantitatives**.  
C'est donc un outil très utile pour une première visualisation du type et de la distribution de ces variables.

Pour analyser les variables **catégorielles**, il est préférable de commencer par utiliser la méthode **`value_counts`** qui renvoie le nombre d'occurrences pour chaque modalité de ces variables. La méthode `value_counts` ne peut pas s'utiliser directement sur un `DataFrame` mais que sur les colonnes du `DataFrame` qui sont des objets de la classe **`pd.Series`**.

```python
DataFrame.value_counts(
    subset=None, 
    normalize=False, 
    sort=True, 
    ascending=False, 
    dropna=True)

df['col_name'].value_counts()
```
```python
DataFrame.describe()
DataFrame.describe(
    percentiles=None, 
    include=None, 
    exclude=None)
```

cf exercise 2 (10)
La méthode `describe` a calculé des statistiques sur les variables `cust_id`, `prod_subcat_code` et `prod_cat_code` alors que celles-ci sont des variables **catégorielles**.

Bien sûr, ces statistiques n'ont **aucun sens**. La méthode `describe` a traité ces variables comme quantitatives car les modalités qu'elles prennent sont de type numérique. C'est pourquoi il faut **faire attention** aux résultats retournés par la méthode `describe` et toujours **prendre du recul** sur ce que représentent les variables contenues dans le `DataFrame`.



