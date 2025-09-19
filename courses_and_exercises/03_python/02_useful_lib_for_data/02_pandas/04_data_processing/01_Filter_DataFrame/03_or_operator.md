### L'opérateur 'ou' : `|`

L'opérateur `|` sert à filtrer un `DataFrame` sur plusieurs conditions dont **au moins une** doit être vérifiée.

Exemple :

Considérons le même `DataFrame` `df` :

| |quartier|année|surface (en m2)|
|---|---|---|---|
|1|'Champs-Elysées'|1979|70|
|2|'Europe'|1850|110|
|3|'Père-Lachaise'|1935|55|
|4|'Bercy'|1991|30|

Si nous souhaitons retrouver un appartement qui date d'après 1900 **ou** qui est situé dans le quartier de Père-Lachaise, nous pouvons filtrer les lignes de `df` avec le code suivant :

```python
# Filtrage du DataFrame sur les 2 conditions précédentes
print(df[(df['année'] > 1900) | (df['quartier'] == 'Père-Lachaise')])
```

```
>>>          quartier  annee  surface
>>> 0  Champs-Elysées   1979       70
>>> 2   Père-Lachaise   1935       55
>>> 3           Bercy   1991       30
```
