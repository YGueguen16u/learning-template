## Methods : 

- `pd.read_csv(filepath_or_buffer, sep = ',', header = 0, index_col = 0 ... )`

## Attributes : 

- `columns`
- `index`

## 4. Création d'un DataFrame à partir d'un fichier de données

Le plus souvent, les `DataFrame` sont directement créés à partir de fichiers contenant les données d'intérêt.  
Cela peut être un fichier de format CSV, Excel, Texte etc...

Le format le plus courant est le format CSV, qui signifie _Comma-Separated Values_ et désigne un fichier de type tableur dont les valeurs sont séparées par des virgules.

En voici un exemple :

```
A, B, C, D,
1, 2, 3, 4,
5, 6, 7, 8,
9, 10, 11, 12
```

Dans ce format :

- **La première ligne contient le nom des colonnes**, mais il arrive que le nom des colonnes **ne soit pas renseigné**.

- Chaque **ligne** correspond à une **entrée** de la base de données.

- Les valeurs sont séparées par un **caractère de séparation**. Dans cet exemple, il s'agit de `','` mais cela pourrait être un `';'`.

Pour importer ces données dans un `DataFrame`, on utilise alors la fonction `read_csv` de `pandas` dont l'en-tête est la suivante :

```python
pd.read_csv(
	filepath_or_buffer, 
	sep = ',', 
	header = 0, 
	index_col = 0 ... )
```

Les **arguments essentiels** de la fonction pd.read_csv à connaître sont :

- `filepath_or_buffer` : Le **chemin d'accès du fichier** .csv relativement à l'environnement d'exécution. Si le fichier se trouve dans le même dossier que l'environnement Python, il suffit de renseigner le nom du fichier (ex : `'mon_dataframe.csv'`). Ce chemin doit être renseigné sous forme de **chaîne de caractères**.

- `sep` : Le caractère utilisé dans le fichier .csv pour **séparer** les différentes colonnes. Cet argument doit être spécifié sous forme de **caractère**.

- `header` : Le **numéro de la ligne qui contient les noms des colonnes**. Si par exemple les noms de colonnes sont renseignés dans la première ligne du fichier `.csv`, alors il faut spécifier **`header = 0`**. Si les noms ne sont pas renseignés, on mettra `header = None`.

- `index_col` : Le **nom ou numéro de la colonne** contenant les **indices** de la base de données. Si les entrées de la base sont indexées par la première colonne, il faudra renseigner **`index_col = 0`**. Alternativement, si les entrées sont indexées par une colonne qui porte le nom `"Id"`, on pourra spécifier **`index_col = "Id"`**.

Cette fonction retournera un objet de type `DataFrame` qui contient toutes les données du fichier.


