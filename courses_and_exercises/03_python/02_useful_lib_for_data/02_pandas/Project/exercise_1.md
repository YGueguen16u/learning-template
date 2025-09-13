Le directeur d'une épicerie recense les informations suivantes sur son stock de produits alimentaires :

1. **100** pots de miel dont la date d'expiration est le **10/08/2025** et valant **2€** l'unité.

2. **55** paquets de farine expirant le **25/09/2024** coûtant chacun **3€**.

3. **1800** bouteilles de vin à **10€** l'unité expirant **le 15/10/2023**.

- **(a)** À partir d'un **dictionnaire**, créer et afficher le `DataFrame` **`df`** qui **pour chaque produit** doit contenir de manière organisée :
    
     - Son nom. 
     - Sa date d'expiration.
	 - Sa quantité.
	 - Son prix à l'unité.
    

Vous choisirez des noms de colonne pertinents et l'index sera celui par défaut (dans ce cas on ne spécifie pas le paramètre `index`).

```python
dictionnaire = {"Produit"          : ['miel', 'farine', 'vin'],
                "Date d'expiration": ['10/08/2025', '25/09/2024', '15/10/2023'],
                "Quantité"         : [100, 55, 1800], 
                "Prix à l'unité"   : [2, 3, 10]}

df = pd.DataFrame(dictionnaire)

print(df)
```