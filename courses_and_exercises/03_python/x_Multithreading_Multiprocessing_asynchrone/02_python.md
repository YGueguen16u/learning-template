### 2. Implémentation sur Python

#### Multithreading 

Les gains perçues suite à l'utilisation de plusieurs threads sont assez limités sur Python. La librairie `multiprocessing` peut se révéler être une solution car elle permet de contourner le GIL en créant des sous processus au lieu de threads ce qui permet ainsi de bénéficier de meilleures performances en exploitant les différents coeurs d'un processeur.

Dans l'implémention ci-dessous, on cherche tout de même à montrer le gain de temps potentiel obtenue suite à la création de threads. On a créé 2 fonctions qui impriment un message après un temps d'attente. Pour créer les threads nous utilisons la librairie `threading` et l'objet `Thread()`.

```python
from threading import Thread

import time

def sleep_3():
    time.sleep(3)
    print("Je suis exécuté en 3 secondes")

def sleep_2():
    time.sleep(2)
    print("Je suis exécuté en 2 secondes")
```

##### Exécution en séquentiel 
```python
t1=time.time() # On démarre la mesure du temps

sleep_3()          # On exécute la fonction sleep_3
sleep_2()          # On exécute la fonction sleep_2

t2=time.time() # On arrête la mesure du temps

print("\nLa complétion du programme en séquentiel prend : ", t2-t1,"\n")
```

```
Je suis exécuté en 3 secondes
Je suis exécuté en 2 secondes

La complétion du programme en séquentiel prend :  5.00577187538147
```

##### Exécution en threads
```python
th1=Thread(target=sleep_3) # Premier thread avec la fonction sleep_3 

th2=Thread(target=sleep_2) # Deuxième thread avec la fonction sleep_2 

t1=time.time() # On démarre la mesure du temps

th1.start()      # On démarre le thread 1

th2.start()      # On démarre le thread 2

th1.join()       # On s'assure de la complétion du thread 1

th2.join()       # On s'assure de la complétion du thread 2

t2=time.time() # On arrête la mesure du temps

print("\nLa complétion du programme divisé en threads prend : ", t2-t1)
```

```
Je suis exécuté en 2 secondes
Je suis exécuté en 3 secondes

La complétion du programme divisé en threads prend :  3.0040876865386963
```

On remarque que l'exécution séquentielle prend 5 secondes, c'est normal la fonction sleep_3 prend 3 secondes et la fonction sleep_2 prend 2 secondes pour s'exécuter. On cumule leur temps d'exécution respectif. L'utilisation de threads nous permet d'exécuter les deux fonctions en simultanées. C'est pourquoi la fonction sleep_2 se termine avant la fonction sleep_3. Et le temps d'exécution est de 3 secondes car la fonction la plus lente prend 3 secondes pour s'exécuter.

```python
import wikipedia

import time

# On définit la langue de prédilection

wikipedia.set_lang("fr") 

# On définit une liste de titre de pages dont on souhaite obtenir le contenu

pages = ["Multithreading", "Threading", "Programmation_concurrente"]

# On définit une fonction qui retourne la première ligne de chaque page wikipédia 
# dont le nom apparaît dans la liste pages définit précédemment

def wikipedia_fonction(page):
    wiki = wikipedia.page(page)
    text = wiki.content
    print("\n",page,' : ',text.split('.', 1)[0],"\n")

t1=time.time() # On démarre la mesure du temps

# Lancement en séquentiel à l'aide d'une boucle

for page in pages:
    wikipedia_fonction(page) 

t2=time.time() # On arrête la mesure du temps

print (" \n Durée: ",(t2 - t1))
```

```
  
 Multithreading  :  Un processeur est dit multithread s'il est capable d'exécuter efficacement plusieurs threads simultanément 


 Threading  :  Un opérateur de marché (ou opérateur financier) plus communément appelé trader, est un négociateur de produits financiers qui intervient sur les marchés financiers 


 Programmation_concurrente  :  La programmation concurrente est un paradigme de programmation tenant compte, dans un programme, de l'existence de plusieurs piles sémantiques qui peuvent être appelées threads, processus ou tâches 

 
 Durée:  3.2360007762908936
 ```

```python
from threading import Thread

t1=time.time() # On demarre la mesure du temps

# On crée une liste de threads, le nombre de threads correspond au nombre de pages renseigné

threads = [Thread(target=wikipedia_fonction, args=(page,)) for page in pages] 

# On démarre les threads 

for thread in threads:
    thread.start()

# On s'assure de la complétion des threads

for thread in threads:
    thread.join()
    
t2=time.time() # On arrête la mesure du temps

print ("\n Durée:", (t2 - t1))

# Le temps d'exécution est fortement réduit ! 
# L'affichage des pages n'est pas dans le même ordre que décrit au sein de la liste pages
# On ne contrôle pas l'ordre de complétion des threads
```

```
Multithreading  :  Un processeur est dit multithread s'il est capable d'exécuter efficacement plusieurs threads simultanément 


 Programmation_concurrente  :  La programmation concurrente est un paradigme de programmation tenant compte, dans un programme, de l'existence de plusieurs piles sémantiques qui peuvent être appelées threads, processus ou tâches 


 Threading  :  Un opérateur de marché (ou opérateur financier) plus communément appelé trader, est un négociateur de produits financiers qui intervient sur les marchés financiers 


 Durée: 0.8033459186553955
```

#### Multiprocessing 

Afin d'illustrer la parallélisation de différents processus sur Python nous utilisons la librairie `multiprocessing` et l'objet `Pool()`. Nous créons dans un premier temps, une fonction assez coûteuse en temps de calcul, `calcul_lourd`, puis nous exécutons en séquentiel cette fonction pour différents arguments. Nous faisons la même chose en parallélisant l'exécution sur 4 coeurs.

```python
import time
import multiprocessing
from multiprocessing import Pool
import numpy as np

# On définit la fonction calcul_lourd

def calcul_lourd(x): 
    resultat = 0
    for k in range(1, 50):
        resultat += x * np.power(x, 1 / k*np.power(k,3/2))
    return resultat

t1=time.time() # On démarre la mesure du temps

# On exécute la fonction pour différents arguments à la suite

calcul_lourd(range(1000000)) 
calcul_lourd(range(5000000))
calcul_lourd(range(4000000))
calcul_lourd(range(7000000))

t2=time.time() # On arrête la mesure du temps

print("La complétion du programme en séquentiel prend : ", t2-t1)

t1=time.time() # On démarre la mesure du temps

pool = Pool(4) # On crée les processus

# On répartit l'exécution entre les coeurs
resultat = pool.map(calcul_lourd,[range(1000000),range(5000000),range(4000000),range(7000000)]) 

t2=time.time() # On arrête la mesure du temps

print("\nLa complétion du programme en parallèle prend : ",t2-t1)
```

```
La complétion du programme en séquentiel prend :  197.32463669776917

La complétion du programme en parallèle prend :  123.06499242782593
```

Voici un exemple de résultat que nous pouvons obtenir en termes de temps de calcul. Les résultats sont ici très parlants. Il vient que paralléliser permet de gagner plus de la moitié du temps de calcul. Il faut tout de même noter que la création des processus a un coût qui n'est pas "_rentable_" dès lors que les calculs sont légers. Pour des "_petits_" calculs, il aurait été ici plus rapide de rester en séquentiel.

Afin de vous entraînez à manipuler l'exécution parallèle des processus, vous devrez à partir de la fonction suivante `calcul_while` créer plusieurs processus pour accélérer le temps de complétion obtenu en séquentiel.

```python
# On définit la fonction calcul_while

def calcul_while(x): 
       while x>0:
            x-=1

# On définit la liste d'arguments

nombres=[5000000,3000000,6000000,4000000,320000000,2000000, 50000000,10000000]

t1=time.time() # On démarre la mesure du temps

# On exécute en séquentiel

for nb in nombres:
    calcul_while(nb)

t2=time.time() # On arrête la mesure du temps

print("Durée en séquentiel : ",t2-t1)
```

```
Durée en séquentiel :  20.207324504852295
```

```python
# Solution n°1

t1=time.time() # On démarre la mesure du temps

pool = Pool() # On crée les processus 

# On répartit l'exécution entre les coeurs

resultat = pool.map(calcul_while,nombres) 

t2=time.time() # On arrête la mesure du temps

print("Durée de la solution 1 : ",t2-t1)

# Solution n°2

# La syntaxe de la classe Process ressemble en tous points à celle de la classe Thread 
# de la librairie threading 

from multiprocessing import Process

# On crée les processus

processes = [Process(target=calcul_while, args=(nb,)) for nb in nombres] 

t1=time.time() # On démarre la mesure du temps

if __name__ == '__main__':
    
    # On démarre les threads 
    for process in processes:
        process.start()
        
    # On s'assure de la complétion des threads
    for process in processes:
        process.join()

t2=time.time() # On arrête la mesure du temps

print("Durée de la solution 2 : ",t2-t1)

# Les durées sont à peu près équivalentes entre les solutions.

# La classe Process et la classe Pool ne sont pas équivalentes.

# L'utilisation de la classe Pool sera plus appropriée à un grand nombre de tâches
# qui seront réparties entre les coeurs (nombre spécifié).

# La classe Process est plus appropriée à un nombre restreint de tâches.

# La durée de complétion est bien inférieure à celle obtenu avec une exécution en séquentiel.
```

```
Durée de la solution 1 :  17.543944835662842
Durée de la solution 2 :  17.479591131210327
```

### 3. Conclusion

Le **multithreading** et le **multiprocessing** sont souvent des notions confondues, bien que dans les faits, bien différentes. L'exécution parallèle de threads est possible en règle générale bien que délicate compte tenu du partage de mémoire. Sur Python il n'est néanmoins possible d'exécuter qu'un seul thread à la fois à cause du GIL. Ainsi, lorsque l'on fait référence au multithreading, il s'agit la plupart du temps de programmation **concurrente** qui permet donc d'exploiter les **temps de latence** tandis que lorsque l'on fait référence au **multiprocessing** il s'agit de programmation **parallèle** qui permet de réaliser l'exécution de plusieurs processus en simultané .
