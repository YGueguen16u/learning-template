## Methods 

- `fillna`

## Remplacement des valeurs manquantes (méthode `fillna`)

La méthode `fillna` permet de remplacer les valeurs manquantes d'un `DataFrame` par des valeurs de notre choix.

```python
# On remplace tous les NANs du DataFrame par des zéros
 df.fillna(0) 

# On remplace les NANs de chaque colonne numérique par la moyenne sur cette colonne
 df.fillna(df.mean())  # df.mean() peut être remplacée par n'importe quelle méthode statistique.
```

Il est courant de remplacer les valeurs manquantes d'une colonne de **type numérique** avec des **statistiques** comme :

- La **moyenne** : `mean`.

- La **médiane** : `median`.

- Le **minimum/maximum** : `min`/`max`.

Pour les colonnes de type catégorielle, on remplacera les valeurs manquantes avec :

- Le **mode**, i.e. la modalité la plus fréquente : `mode`.

- Une **constante** ou catégorie arbitraire : `0`, `-1`.

Pour éviter de faire des erreurs de remplacement, il est fortement conseillé de **sélectionner les bonnes colonnes** avant d'utiliser la méthode `fillna`.