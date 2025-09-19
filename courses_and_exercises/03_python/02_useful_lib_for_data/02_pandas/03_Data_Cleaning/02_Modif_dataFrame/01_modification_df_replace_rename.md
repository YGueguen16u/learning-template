## Methods

- `replace`

- `rename`

- `astype`


## Modification des éléments d'un `DataFrame` (méthodes `replace`, `rename` et `astype`)

La méthode **`replace`** permet de **remplacer** une ou plusieurs valeurs d'une colonne d'un `DataFrame`.

Son en-tête est le suivant :

```python
replace(to_replace, value, ...)
```

- Le paramètre `to_replace` contient la valeur ou la liste de valeurs **à remplacer**. Cela peut être une liste d'entiers, de chaînes de caractères, de booléens, etc...

- Le paramètre `value` contient la valeur ou la liste de valeurs **remplaçantes**. Cela peut aussi être une liste d'entiers, de chaines de caractères, de booléens, etc...


![](https://assets-datascientest.s3-eu-west-1.amazonaws.com/train/replace.png)
En plus de modifier les éléments d'un `DataFrame`, il est possible de **renommer** ses colonnes.

Cela est possible grâce à la méthode **`rename`** qui prend en argument un **dictionnaire** dont les **clés** sont les **anciens** noms et les **valeurs** sont les **nouveaux** noms.  
Il faut aussi renseigner l'argument **`axis = 1`** pour préciser que les noms à renommer sont ceux des colonnes.

```python
# Création du dictionnaire associant les anciens noms aux nouveaux noms de colonnes
dictionnaire = {'ancien_nom1': 'nouveau_nom1',
                'ancien_nom2': 'nouveau_nom2'}

# On renomme les variables grâce à la méthode rename
df = df.rename(dictionnaire, axis = 1) 
```

Il est parfois nécessaire de modifier non seulement le nom d'une colonne mais aussi son **type**.

Par exemple, il se peut que lors de l'importation d'une base de données une variable soit de type chaîne de caractères alors qu'elle est réellement de type numérique.  
Il suffit qu'une des entrées de la colonne soit mal reconnue et pandas considèrera que cette colonne est de type chaîne de caractères.

Cela est possible grâce à la méthode **`astype`**.

Les types que nous verrons le plus souvent sont :

- `str` : Chaîne de caractères (`'Bonjour'`).

- `float` : Nombre à virgule flottante (`1.0`, `1.14123`).

- `int` : Nombre entier (`1`, `1231`).

Comme pour la méthode **`rename`**, **`astype`** peut prendre en argument un dictionnaire dont les **clés** sont les **noms des colonnes** concernées et les **valeurs** sont les **nouveaux types** à assigner.  
Cela est pratique si l'on veut modifier le type de plusieurs colonnes en même temps.

Le plus souvent, on voudra directement sélectionner la colonne dont on veut modifier le type et l'écraser en lui appliquant la méthode **`astype`**.

```python
# Méthode 1 : Création d'un dictionnaire puis appel à la méthode astype du DataFrame
dictionnaire = {'col_1': 'int',
                'col_2': 'float'}
df = df.astype(dictionnaire)

# Méthode 2 : Sélection de la colonne puis appel à la méthode astype d'une Series
df['col_1'] = df['col_1'].astype('int') 
```

Les méthodes `rename` et `replace` disposent aussi du paramètre `inplace` pour effectuer l'opération directement sur le `DataFrame`. À utiliser avec grande prudence.
