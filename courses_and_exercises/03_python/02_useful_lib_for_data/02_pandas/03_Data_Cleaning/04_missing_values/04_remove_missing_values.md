## Methods 

- `dropna`

### Suppression des valeurs manquantes (méthode `dropna`)

La méthode `dropna` permet de supprimer les lignes ou colonnes contenant des valeurs manquantes.

L'en-tête de la méthode est la suivante : `dropna(axis, how, subset, ..)`

- Le paramètre **`axis`** précise si on doit supprimer des lignes ou des colonnes (**`0`** pour les lignes, **`1`** pour les colonnes).

- Le paramètre **`how`** permet de préciser comment les lignes (ou les colonnes) sont supprimées :
	- **`how = 'any'`**: On supprime la ligne (ou colonne) si elle contient **au moins une** valeur manquante.
	
	- **`how = 'all'`** : On supprime la ligne (ou colonne) si elle ne contient **que** des valeurs manquantes.

- Le paramètre **`subset`** permet de préciser les colonnes/lignes sur lesquelles on effectue la recherche de valeurs manquantes.

Exemple :  

```python
# On supprime toutes les lignes contenant au moins une valeur manquante
df = df.dropna(axis = 0, how = 'any')

# On supprime les colonnes vides 
df = df.dropna(axis = 1, how = 'all') 

# On supprime les lignes ayant des valeurs manquantes dans les 3 colonnes 'col2','col3' et 'col4'
df = df.dropna(axis = 0, how = 'all', subset = ['col2','col3','col4']) 
```

Comme pour les autres méthodes de remplacement de valeurs d'un `DataFrame`, l'argument `inplace` peut être utilisé avec grande précaution pour effectuer la modification directement sans réassignation.