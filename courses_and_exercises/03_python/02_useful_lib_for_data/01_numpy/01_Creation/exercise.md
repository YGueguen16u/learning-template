(a) À l'aide des constructeurs et du slicing des arrays, créer et afficher la matrice diagonale par blocs suivante :

$\begin{bmatrix} 
1 & 1 & 1 & 0 & 0 & 0 \\
1 & 1 & 1 & 0 & 0 & 0 \\
1 & 1 & 1 & 0 & 0 & 0 \\
0 & 0 & 0 & -1 & -1 & -1 \\
0 & 0 & 0 & -1 & -1 & -1 \\
0 & 0 & 0 & -1 & -1 & -1
\end{bmatrix}$

```python
import numpy as np

X = np.zeros((6,6))
X[0:3, 0:3] = np.ones((3,3))
X[3:, 3:] = -1 * np.ones((3,3))
# X[0:3, 0:3] = 1
# X[3:, 3:] = -1

print(X)
```

(b) À l'aide des constructeurs et du slicing des arrays, créer et afficher la matrice suivante :

$\begin{bmatrix} 
0 & 1 & 2 & 3 & 4 & 5 \\
0 & 1 & 2 & 3 & 4 & 5 \\
0 & 1 & 2 & 3 & 4 & 5 \\
0 & 1 & 2 & 3 & 4 & 5 \\
0 & 1 & 2 & 3 & 4 & 5 \\
0 & 1 & 2 & 3 & 4 & 5
\end{bmatrix}$

```python
import numpy as np

X = np.zeros((6,6))

for i in range(6):
    X[:, i] = i

print(X)
```

Nous disposons de données d'un supermarché américain qui se prépare pour le Black Friday, une journée où les commerces américains proposent de très grandes réductions pour finir leurs saisons.

Ces données sont distribuées sur 3 arrays :

- `items` : Le nom des objets qui seront en promotion.
- `quantities` : Le stock disponible pour chaque objet en promotion.
- `discounts` : La réduction de prix de chaque objet. Les objets peuvent avoir une réduction de 25, 50, 75 ou 90 pourcents.

(a) Lancer la cellule suivante pour instancier les arrays contenant les données du supermarché.

```python
import numpy as np

items = np.array(["grid paper","plate","rubber band","key chain","bread","speakers","chocolate",
                  "fridge","bowl","shirt","truck","canvas","monitor","piano","sailboat","clamp",
                  "spring","picture frame","knife","hanger","pool stick","buckel","vase","wagon",
                  "balloon","thread","couch","drawer","packing peanuts","bottle","needle",
                  "rusty nail","blanket","lamp","box","cookie jar","washing machine","paint brush",
                  "puddle","sketch pad","sandal","doll","floor","sidewalk","sand paper","stockings",
                  "bag","perfume","magnet","fake flowers","street lights","carrots","purse","thermostat",
                  "candle","mouse pad","remote","clothes","rubber duck","hair brush","computer","toe ring",
                  "scotch tape","nail file","window","table","model car","toothbrush","shoes","leg warmers",
                  "cat","pillow","rug","hair tie","phone","tooth picks","broccoli","newspaper","towel",
                  "watch","lotion","apple","pants","air freshener","pen","lace","car","headphones",
                  "charger","toilet","candy wrapper","soy sauce packet","sticky note","shoe lace",
                  "zipper","soda can","bed","cell phone","lip gloss","thermometer"])

quantities = np.array([310, 455, 295, 613, 812, 907, 564, 904, 829, 167, 517, 272, 416,
                       14, 251, 476, 757, 343, 472,  71, 160, 996, 182, 721, 565, 582,
                       279,  66, 297, 800, 914,  69, 498, 885, 114, 876, 635, 295, 146,
                       601, 941, 100, 370, 467, 423, 101, 504, 298, 757, 291, 163, 970,
                       921, 953, 458, 381, 692, 393, 749, 285, 454, 174,  37, 289, 863,
                       885, 331, 585, 678, 834, 349, 732, 149, 486, 993, 869, 967, 537,
                       220,  15, 457, 483, 387, 180, 579, 155, 134, 163, 314, 334, 429,
                       154,  18, 426, 363, 146, 454, 902, 145,  95])

discounts = np.array([25, 25, 50, 25, 50, 50, 50, 25, 50, 50, 25, 25, 25, 25, 50, 75, 25,
                      50, 50, 50, 25, 25, 25, 25, 75, 50, 25, 25, 25, 25, 90, 50, 25, 25,
                      25, 50, 50, 25, 25, 75, 75, 50, 25, 25, 50, 25, 90, 90, 50, 90, 25,
                      25, 25, 25, 25, 25, 25, 50, 25, 25, 75, 50, 50, 25, 50, 25, 25, 50,
                      25, 75, 25, 25, 50, 25, 25, 50, 75, 25, 25, 90, 25, 75, 25, 25, 25,
                      25, 25, 25, 50, 50, 75, 25, 50, 25, 25, 50, 25, 25, 25, 75])
```

(b) À l'aide d'une indexation conditionnelle sur items et quantities, afficher le nom et la quantité de chaque objet qui aura une réduction de 90%.

(c) Vous souhaitez vous acheter un nouveau téléphone portable ("cell phone") et des enceintes sonores ("speakers"). Déterminer à l'aide d'une indexation conditionnelle sur discounts la réduction qui leur sera accordée.

(d) Le gérant du supermarché voudrait savoir quels objets risquent de partir très vite. Afficher le nom des objets dont la quantité est inférieure à 50 et la réduction qui leur est accordée.

(e) Quel objet risque de partir extrêmement vite ?

```python
# Affichage du nom des objets dont la réduction est de 90%
print(items[discounts == 90])

# Affichage de la quantité des objets dont la réduction est de 90%
print(quantities[discounts == 90])

#print(f"pour les cell phones et les speakers : {discounts[(items == 'cell phone') | (items == 'speakers')]}")

reduction_telephone = discounts[items == 'cell phone']
print("Les téléphones auront une réduction de", reduction_telephone[0], "pourcents.")


reduction_enceintes = discounts[items == 'speakers']
print("Les enceintes auront une réduction de", reduction_enceintes[0], "pourcents.")

print("Objets   ", items[quantities <= 50])
print("Réduction", discounts[quantities <= 50])

print("\n")
print("Les montres ('watch') risquent de partir très vite car elles sont en faible quantité et ont une réduction de 90.")
```


