## L'opérateur 'et' : `&`

L'opérateur `&` sert à filtrer un `DataFrame` sur plusieurs conditions qui doivent être vérifiées **simultanément**.

Exemple :

Considérons le `DataFrame` `df` suivant regroupant les informations sur des appartements à Paris :

| |quartier|annee|surface|
|---|---|---|---|
|**0**|'Champs-Elysées'|1979|70|
|**1**|'Europe'|1850|110|
|**2**|'Père-Lachaise'|1935|55|
|**3**|'Bercy'|1991|30|

Si nous souhaitons retrouver un appartement datant de 1979 **et** ayant une surface supérieure à 60 m2, nous pouvons filtrer les lignes de `df` avec le code suivant :

```python

# Filtrage du DataFrame sur les 2 conditions précédentes
print(df[(df['annee'] == 1979) & (df['surface'] > 60)])
```

```
>>>           quartier  annee  surface
>>> 0  Champs-Elysées   1979       70
```

Les conditions doivent être renseignées **entre parenthèses** pour éliminer l'ambigüité sur l'ordre d'évaluation des conditions.  
En effet, si les conditions ne sont pas proprement séparées, nous obtiendrons l'erreur suivante :

```python
print(df[df['annee'] == 1979 & df['surface'] > 60])
```

```
>>> ValueError: The truth value of a Series is ambiguous. Use a.empty, a.bool(), a.item(), a.any() or a.all().
```
