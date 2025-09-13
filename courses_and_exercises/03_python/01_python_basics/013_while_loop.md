
2. La boucle while

Le mot-clé while signifie "tant que" en anglais. La boucle while permet de répéter un bloc d'instructions tant que la condition de départ est vraie (ou jusqu'à ce qu'elle soit fausse).

Par exemple, pour déterminer l'indice du mot "trouvé" dans une liste de mots, il suffit de parcourir tous les indices de la liste jusqu'à trouver la chaîne "trouvé" :

```python
   # La liste de mots dans laquelle nous voulons trouver le mot "trouvé".
   phrase = ['La', 'boucle', 'while', 'parcourt', 'tous', 'les', 'éléments', 
              'de', 'la', 'liste', "jusqu'à", 'ce', "qu'elle", 'ait', 'trouvé', 
              'ce', "qu'elle", 'cherche', '.']

   # La variable i va stocker l'indice dans lequel nous sommes
   i=0

   # Tant que le mot à l'indice où nous sommes est différent de "trouvé"
   while phrase[i] != 'trouvé':
       # On incrémente la valeur de i de 1 pour passer à l'indice suivant
       i += 1

   # La boucle s'arrête lorsque nous avons trouvé le bon mot
   print("Le mot 'trouvé' est à l'indice", i)
```

```sh
   >>>> Le mot 'trouvé' est à l'indice 14
```

La structure générale d'une boucle while est la suivante :

   while condition:
       instruction1
       ...
       instructionN

   autre_instruction                
À chaque itération de la boucle while, la condition est évaluée. Si la condition est vérifiée, le bloc d'instructions est éxécuté, sinon la boucle se termine.

Les lignes en dehors du bloc d'instruction ne font pas partie de la boucle, elles ne sont donc exécutées qu'une fois la boucle terminée.

Si la condition est fausse dès le départ, le bloc d'instruction `n’est jamais exécuté`.

Inversement, si la condition reste toujours vraie, le bloc d'instruction est exécuté indéfiniment. Il est donc important de s'assurer que la boucle va se terminer avant de l'exécuter.

### break

Souvent, l'utilisation d'une boucle implique de parcourir l'ensemble des éléments d'une structure de données. C'est là qu'intervient le mot-clé break qui permet de sortir d'une boucle et de passer à l'instruction suivante. On peut par exemple, l'utiliser pour les boucles for et while lorsqu'une condition spécifique est validée comme cela est visible sur l'exemple ci-dessous :

```python
i = 0
while(i<15):
    print(i)
    if i==1:
        break # On sort de la boucle while dès que i est égal à 1
    i += 1
```

