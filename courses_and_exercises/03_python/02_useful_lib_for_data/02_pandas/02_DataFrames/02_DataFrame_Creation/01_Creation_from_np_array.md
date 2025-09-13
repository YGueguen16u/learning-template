## Methods : 

- `pd.DataFrame(data, index, columns, ...)`

## Attributes : 

- `columns`
- `index`

## 2. Création d'un DataFrame à partir d'un array NumPy

Il est possible de créer directement un `DataFrame` à partir d'un array `NumPy` grâce au constructeur `DataFrame()`.  
L'inconvénient de cette méthode est qu'elle n'est pas très pratique et le type des données est obligatoirement le même pour toutes les colonnes.

Regardons d'un peu plus près l'en-tête de ce constructeur.

```python
pd.DataFrame(data, index, columns, ...)
```

- Le paramètre `data` contient les **données** à mettre en forme (array `NumPy`, liste, dictionnaire ou un autre `DataFrame`).

- Le paramètre `index`, si précisé, doit être une **liste** contenant les **indices des entrées**.

- Le paramètre `columns`, si précisé, doit être une **liste** contenant le **nom des colonnes**.

Pour les autres paramètres, vous pouvez consulter la [documentation](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.html) Python.

Exemple :

```python
# Création d'un array NumPy 
array = np.array([[1, 2, 3, 4], 
                  [5, 6, 7, 8], 
                  [9, 10, 11, 12]])

# Instanciation d'un DataFrame 
df = pd.DataFrame(data = array,                 # Les données à mettre en forme
                  index = ['i_1', 'i_2', 'i_3'],  # Les indices de chaque entrée
                  columns = ['A', 'B', 'C', 'D']) # Le nom des colonnes
```

Ceci produit le `DataFrame` suivant :

| |A|B|C|D|
|---|---|---|---|---|
|**i_1**|1|2|3|4|
|**i_2**|5|6|7|8|
|**i_3**|9|10|11|12|

