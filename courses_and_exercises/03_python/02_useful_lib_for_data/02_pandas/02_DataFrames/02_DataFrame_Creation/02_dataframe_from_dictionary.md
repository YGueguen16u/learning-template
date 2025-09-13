## 3. Création d'un DataFrame à partir d'un dictionnaire


Une autre méthode pour créer un `DataFrame` est d'utiliser un dictionnaire.  
Grâce à cette technique, les colonnes peuvent être de type différent et sont déjà définies lors de la création du `DataFrame`.

Exemple :

```python
# Création d'un dictionnaire
dictionnaire = {'A': [1, 5, 9], 
                'B': [2, 6, 10],
                'C': [3, 7, 11],
                'D': [4, 8, 12]}

# Instanciation d'un DataFrame 
df = pd.DataFrame(data = dictionnaire,
                  index = ['i_1', 'i_2', 'i_3'])
```

Ceci produit le même `DataFrame` que précédemment :

|         | A   | B   | C   | D   |
| ------- | --- | --- | --- | --- |
| **i_1** | 1   | 2   | 3   | 4   |
| **i_2** | 5   | 6   | 7   | 8   |
| **i_3** | 9   | 10  | 11  | 12  |


