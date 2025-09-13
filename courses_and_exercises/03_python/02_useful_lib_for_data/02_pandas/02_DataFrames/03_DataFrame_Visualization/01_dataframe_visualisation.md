## Methods : 

- `head(n)`
- `tail(n)`

## Attributes : 

- `columns`
- `shape`

## 6. Visualisation d'un `DataFrame`: méthode `head`, attributs `columns` et `shape`
    
Il est possible d'avoir un aperçu d'un jeu de données en affichant **seulement les premières lignes** du `DataFrame`.

Pour cela, il faut utiliser la méthode **`head()`** en lui spécifiant en argument **le nombre de lignes** que nous souhaitons afficher (par défaut 5).

Il est aussi possible d'avoir un aperçu des **dernières lignes** en utilisant la méthode **`tail()`** qui s'applique de la même manière :

```python
# Affichage des 10 premières lignes d'un DataFrame mon_dataframe
mon_dataframe.head(n = 10)
type(mon_dataframe.head(10)) # pandas.core.frame.DataFrame

# Affichage des 10 dernières lignes d'un DataFrame mon_dataframe
mon_dataframe.tail(10)
```

Il est possible de récupérer le **nom des colonnes** d'un `DataFrame` grâce à son attribut `columns` :

```python
# Création d'un DataFrame df à partir d'un dictionnaire
dictionnaire = {'A': [1, 5, 9], 
                'B': [2, 6, 10],
                'C': [3, 7, 11],
                'D': [4, 8, 12]}

df = pd.DataFrame(data = dictionnaire, index = ['i_1', 'i_2', 'i_3'])
```

Ces instructions produisent le même `DataFrame` que précédemment :

| |A|B|C|D|
|---|---|---|---|---|
|**i_1**|1|2|3|4|
|**i_2**|5|6|7|8|
|**i_3**|9|10|11|12|

```python
# Affichage des colonnes du DataFrame df
col = df.columns
print(col) # ['A', 'B', 'C', 'D']
print(type(col)) # <class 'pandas.core.indexes.base.Index'>
print(df.columns[2]) # 'C'
```

La liste du nom des colonnes est utile pour parcourir les colonnes d'un `DataFrame` à l'aide **d'une boucle.**

Il peut être intéressant de savoir combien de transactions (lignes) et combien de caractéristiques (colonnes) le dataset contient.

Pour cela nous allons utiliser l'attribut **`shape`** du `DataFrame` qui affiche les **dimensions** de notre `DataFrame` sous la forme d'un tuple (nombre de lignes, nombre de colonnes) :

```python
# Affichage des dimensions de mon_dataframe
print(mon_dataframe.shape)
>>> (3,4)
```

