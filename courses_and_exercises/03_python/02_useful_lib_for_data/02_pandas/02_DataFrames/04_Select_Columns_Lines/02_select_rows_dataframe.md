## Methods : 


## Attributes : 

- `loc`
- `iloc`

## 8. Sélection de lignes d'un `DataFrame`: méthodes `loc` et `iloc`

Pour extraire une ou plusieurs **lignes** d'un `DataFrame`, nous utilisons la méthode **`loc`**.  
`loc` est un type de méthode très spécial car les arguments sont renseignés **entre crochets** et non entre parenthèses.  
L'utilisation de cette méthode est très similaire à l'indexation des listes.

```python
df.loc[i]
``` 

Afin de récupérer la ligne d'indice `i` d'un `DataFrame`, il suffit de renseigner `i` en argument de la méthode `loc` :

```python
# On récupère la ligne d'indice 80712190438 du DataFramer num_vars
print(num_vars.loc[80712190438])
```

```
>>>                 Rate    Tax  total_amt
>>> transaction_id                         
>>> 80712190438    -772.0  405.3    -4265.3
>>> 80712190438     772.0  405.3     4265.3
```

Afin de récupérer **plusieurs lignes**, nous pouvons soit :

- Renseigner une **liste d'indices**.

- Utiliser le **slicing** en précisant les indices de début et de fin de la plage.

```python
# On récupère les lignes d'indice 80712190438, 29258453508 et 51750724947 du DataFrame transactions
transactions.loc[[80712190438, 29258453508, 51750724947]]
```

`loc` peut aussi prendre en argument une colonne ou **liste de colonnes** afin d'affiner l'extraction de données :

```python
df.loc[i, 'col_1']               # Single row i, single column 'col_1'
df.loc[i, ['col_1', 'col_2']]    # Single row i, multiple columns
df.loc[[i, j], ['col_1', 'col_2']]  # Multiple specific rows and columns

df.loc[:, 'col_1']                # All rows, single column
df.loc[:, ['col_1', 'col_2']]     # All rows, multiple columns

df.loc[i:j]                       # Rows from i to j (inclusive)
df.loc[i:j, 'col_1']             # Rows i to j, single column
df.loc[i:j, ['col_1', 'col_2']]  # Rows i to j, multiple columns

df.loc[i:j:pas]                   # Rows from i to j with step
df.loc[i:j:pas, 'col_1']         # With single column
df.loc[i:j:pas, ['col_1', 'col_2']]  # With multiple columns

df.loc[[i, j], :]                 # Specific rows, all columns
df.loc[i:j, ['col_1', 'col_2']]  # Row slice with specific columns
``` 

```python
# On extrait les colonnes 'Tax' et 'total_amt' des lignes d'indices 80712190438 et 29258453508
transactions.loc[[80712190438, 29258453508], ['Tax', 'total_amt']]  
```

Cette instruction produit le `DataFrame` suivant :

|transaction_id|Tax|total_amt|
|---|---|---|
|**80712190438**|405.300|-4265.300|
|**80712190438**|405.300|4265.300|
|**29258453508**|785.925|-8270.925|
|**29258453508**|785.925|8270.925|

La méthode **`iloc`** permet d'indexer un `DataFrame` **exactement comme un array numpy**, c'est-à-dire en ne renseignant que les indexes numériques des lignes et colonnes. Ceci permet d'utiliser le slicing sans contraintes :

```python
df.iloc[index]                     # Single row by position
df.iloc[0]                         # First row
df.iloc[-1]                        # Last row

df.iloc[index, column]             # Single row and column by position
df.iloc[0, 0]                      # First row, first column
df.iloc[1, 2]                      # Second row, third column

df.iloc[index, [column_1, column_2]]  # Single row, multiple columns
df.iloc[0, [0, 1]]                    # First row, first two columns

df.iloc[[index_1, index_2], [column_1, column_2]]  # Multiple rows and columns
df.iloc[[0, 2], [1, 3]]                           # Rows 0 & 2, columns 1 & 3

df.iloc[i:j:pas, [column_1, column_2]]  # Row slice with step, specific columns
df.iloc[0:5:2, [0, 2]]                  # Every 2nd row from 0-4, columns 0 & 2

# Additional useful patterns:
df.iloc[:, column]                 # All rows, single column
df.iloc[:, :2]                     # All rows, first two columns
df.iloc[1:4, :]                    # Rows 1-3, all columns

# Extraction des 4 premières lignes et des 3 premières colonnes de transactions
transactions.iloc[0:4, 0:3]
```

Cette instruction produit le `DataFrame` suivant :

|transaction_id|cust_id|tran_date|prod_subcat_code|
|---|---|---|---|
|**80712190438**|270351|28-02-2014|1.0|
|**29258453508**|270384|27-02-2014|5.0|
|**51750724947**|273420|24-02-2014|6.0|
|**93274880719**|271509|24-02-2014|11.0|

Dans le cas où l'indexation des lignes est celle par défaut (numérotation des lignes), les méthodes loc et iloc sont **équivalentes**.
