### L'opérateur 'non' : `-`

L'opérateur `-` sert à filtrer un `DataFrame` sur une condition dont la **négation** doit être vérifiée.

Exemple :

Considérons le même `DataFrame` `df` :

| |quartier|année|surface (en m2)|
|---|---|---|---|
|1|'Champs-Elysées'|1979|70|
|2|'Europe'|1850|110|
|3|'Père-Lachaise'|1935|55|
|4|'Bercy'|1991|30|

Si nous souhaitons un appartement ne se situant pas dans le quartier de Bercy alors on filtre `df` de la manière suivante :

```python
# Filtrage du DataFrame sur tous les quartiers sauf Bercy
print(df[-(df['quartier'] == 'Bercy')])
```

```
>>>          quartier  annee  surface
>>> 0  Champs-Elysées   1979       70
>>> 1          Europe   1850      110
>>> 2   Père-Lachaise   1935       55
```
