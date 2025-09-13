- **(1)** Charger les données contenues dans le fichier **`transactions.csv`** dans un `DataFrame` nommé **`transactions`** :

    - Le fichier se trouve dans le **même dossier** que l'environnement de ce notebook.

    - Les colonnes sont séparées par une **virgule**.

    - Les noms des colonnes sont renseignés sur la**première ligne**du fichier.

    - Les lignes de la base sont indexées par la colonne**"transaction_id"**qui est aussi la**première colonne**.

```
                cust_id   tran_date  prod_subcat_code  prod_cat_code  Qty  \
transaction_id                                                              
80712190438      270351  28-02-2014               1.0              1   -5   
29258453508      270384  27-02-2014               5.0              3   -5   
51750724947      273420  24-02-2014               6.0              5   -2   
93274880719      271509  24-02-2014              11.0              6   -3   
51750724947      273420  23-02-2014               6.0              5   -2   

                  Rate      Tax  total_amt Store_type  
transaction_id                                         
80712190438     -772.0  405.300  -4265.300     e-Shop  
29258453508    -1497.0  785.925  -8270.925     e-Shop  
51750724947     -791.0  166.110  -1748.110   TeleShop  
93274880719    -1363.0  429.345  -4518.345     e-Shop  
51750724947     -791.0  166.110  -1748.110   TeleShop
```

Nous avons chargé le fichier `transactions.csv` dans le `DataFrame` **`transactions`** qui regroupe un historique de transactions effectuées entre 2011 et 2014.  
Dans la section suivante, nous allons étudier ce dataset.

- **(2)** Dans un`DataFrame`nommé**`cat_vars`**, stocker les variables**catégorielles**de`transactions`.

    - Les variables catégorielles du`DataFrame`transactions sont :`['cust_id', 'tran_date', 'prod_subcat_code', 'prod_cat_code', 'Store_type']`

- **(3)** Dans un`DataFrame`nommé**`num_vars`**, stocker les variables**quantitatives**de`transactions`.

    - Les variables quantitatives du`DataFrame`transactions sont :`['Qty', 'Rate', 'Tax', 'total_amt']`

- **(4)** Afficher les 5 premières lignes de chaque`DataFrame`.

| transaction_id | cust_id | tran_date  | prod_subcat_code | prod_cat_code | Store_type |
| -------------- | ------- | ---------- | ---------------- | ------------- | ---------- |
| 80712190438    | 270351  | 28-02-2014 | 1.0              | 1             | e-Shop     |
| 29258453508    | 270384  | 27-02-2014 | 5.0              | 3             | e-Shop     |
| 51750724947    | 273420  | 24-02-2014 | 6.0              | 5             | TeleShop   |
| 93274880719    | 271509  | 24-02-2014 | 11.0             | 6             | e-Shop     |
| 51750724947    | 273420  | 23-02-2014 | 6.0              | 5             | TeleShop   |

| transaction_id | Qty | Rate    | Tax     | total_amt |
| -------------- | --- | ------- | ------- | --------- |
| 80712190438    | -5  | -772.0  | 405.300 | -4265.300 |
| 29258453508    | -5  | -1497.0 | 785.925 | -8270.925 |
| 51750724947    | -2  | -791.0  | 166.110 | -1748.110 |
| 93274880719    | -3  | -1363.0 | 429.345 | -4518.345 |
| 51750724947    | -2  | -791.0  | 166.110 | -1748.110 |

Le gérant des transactions répertoriées dans le `DataFrame` **`transactions`** souhaite avoir accès aux **identifiants** des clients ayant fait un achat **en ligne** (c'est-à-dire dans un `"e-Shop"`) ainsi que **la date de la transaction correspondante**.

Nous avons les informations suivantes concernant les colonnes de `transactions` :

|Nom de la colonne|Description|
|---|---|
|`'cust_id'`|Les **identifiants** des clients|
|`'Store_type'`|Le **type de magasin** où s'est faite la transaction|
|`'tran_date'`|La **date** des transactions|

- **(5)** Dans un `DataFrame` nommé **`transactions_eshop`**, stocker les transactions qui ont lieu dans un magasin de type `"e-Shop"`.

- **(6)** Dans un autre `DataFrame` nommé **`transactions_id_date`**, stocker les identifiants des clients et la date des transactions du `DataFrame` `transactions_eshop`.

- **(7)** Afficher les 5 premières lignes de`transactions_id_date`.


| |cust_id|tran_date|prod_subcat_code|prod_cat_code|Qty|Rate|Tax|total_amt|Store_type|
|---|---|---|---|---|---|---|---|---|---|
|transaction_id||||||||||
|---|---|---|---|---|---|---|---|---|---|
|80712190438|270351|28-02-2014|1.0|1|-5|-772.0|405.300|-4265.300|e-Shop|
|29258453508|270384|27-02-2014|5.0|3|-5|-1497.0|785.925|-8270.925|e-Shop|
|93274880719|271509|24-02-2014|11.0|6|-3|-1363.0|429.345|-4518.345|e-Shop|
|45649838090|273667|22-02-2014|11.0|6|-1|-1450.0|152.250|-1602.250|e-Shop|
|50076728598|269014|21-02-2014|8.0|3|-4|-581.0|244.020|-2568.020|e-Shop|

| |cust_id|tran_date|
|---|---|---|
|transaction_id|||
|---|---|---|
|80712190438|270351|28-02-2014|
|29258453508|270384|27-02-2014|
|51750724947|273420|24-02-2014|
|93274880719|271509|24-02-2014|
|51750724947|273420|23-02-2014|

À présent, le gérant voudrait avoir accès aux transactions effectuées par le client d'identifiant `268819`.

- **(8)** Dans un `DataFrame` nommé **`transactions_client_268819`**, stocker toutes les transactions dont l'identifiant du client est `268819`.

- **(9)** Une colonne d'un `DataFrame` peut être parcourue comme une liste dans une boucle `for`. À l'aide d'une boucle `for` sur la colonne `'total_amt`', calculer et afficher le montant total des transactions du client `268819`.


| |cust_id|tran_date|prod_subcat_code|prod_cat_code|Qty|Rate|Tax|total_amt|Store_type|
|---|---|---|---|---|---|---|---|---|---|
|transaction_id||||||||||
|---|---|---|---|---|---|---|---|---|---|
|11878870074|268819|26-01-2014|10.0|5|-4|-1486.0|624.12|-6568.12|e-Shop|
|11878870074|268819|23-01-2014|10.0|5|4|1486.0|624.12|6568.12|e-Shop|
|22303224302|268819|19-12-2013|10.0|5|-2|-152.0|31.92|-335.92|Flagship store|
|22303224302|268819|11-12-2013|10.0|5|2|152.0|31.92|335.92|Flagship store|
|9987404340|268819|7-10-2013|10.0|5|1|1220.0|128.10|1348.10|e-Shop|

Le gérant des transactions souhaite faire un rapport rapide sur les caractéristiques des transactions : il souhaite notamment connaître le **montant moyen dépensé** ainsi que la **quantité maximale** achetée.


- **(10)** Utiliser la méthode `describe` du `DataFrame` `transactions`.

    - **(13)** Quel est le montant total moyen dépensé ? On s'intéressera à la colonne `'total_amt'` de **`transactions`**.

    - **(14)** Quelle est la quantité maximale achetée ? On s'intéressera à la colonne `'Qty'` de **transactions**.

- **(11)** Les variables quantitatives sont `'Qty'`, `'Rate'`, `'Tax'` et `total_amt`. Est-ce que par défaut les statistiques produites par la méthode `describe` ne sont calculées **que** sur les variables quantitatives ?

- **(12)** Afficher le nombre d'occurrences de chaque modalité que prend la variable `Store_type` à l'aide de la méthode `value_counts`.


Certaines transactions ont des montants **négatifs**.  
Il s'agit de transactions qui ont été annulées et remboursées au client.  
Ces montants vont perturber la distribution des montants ce qui nous donne de **mauvaises estimations** des moyennes et quantiles de la variable `total_amt`.

- **(13)** Quelle est la moyenne du montant des transactions dont le montant est **positif** ?
