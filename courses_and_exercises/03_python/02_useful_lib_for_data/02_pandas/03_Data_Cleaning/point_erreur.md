### Point erreur fréquente : Modification de DataFrames dans Pandas avec et sans assignation

#### 1. Opérations qui modifient en place (inplace)

Certaines méthodes modifient directement le DataFrame original :

```python
# fillna() avec inplace=True
df.fillna(0, inplace=True)

# drop() avec inplace=True  
df.drop('colonne', inplace=True)
```

#### 2. Opérations qui retournent une copie (non-inplace)

La plupart des méthodes Pandas retournent une nouvelle copie et ne modifient PAS le DataFrame original :

```python
# replace() - retourne une copie  
df_new = df.replace(['old'], ['new'])  
  
# astype() - retourne une copie  
df_new = df.astype({'col': 'int'})   
  
# rename() - retourne une copie  
df_new = df.rename({'old_name': 'new_name'})
```

Pour ces méthodes, il faut soit :

- Réassigner le résultat à une nouvelle variable
- Réassigner au DataFrame original
- Utiliser le paramètre inplace=True si disponible

##### Exemple incorrect :

```python
df.astype({'col': 'int'})  # Pas d'effet, le résultat n'est pas sauvegardé
df.head(10) # L'ancien dataset avec l'ancien type qui sera affiché
```

##### Exemple correct :

```python
df = df.astype({'col': 'int'})  # Sauvegarde les modifications
```
