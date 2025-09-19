#### La programmation asynchrone 

##### Définition 

Un programme exécuté en asynchrone, tout comme un programme synchrone, débute l'éxécution des tâches qui le composent **successivement**. La différence réside dans l'**attente de la complétion** de chaque tâche. Tandis qu'un programme synchrone attend que l'exécution de chaque tâche soit complétée avant d'exécuter une autre tâche, un programme **asynchrone** débute l'exécution des tâches les unes à la suite des autres sans attendre. La notion de programmation **concurrente** est ainsi au coeur de la programmation asynchrone, puisque les tâches sont exécutées au sein d'un même intervalle de temps et non pas de façon séquentielle. L'exemple ci-dessous illustre le traitement synchrone et asynchrone. Pour l'exécution synchrone suite à la complétion de la tâche 1, la tâche 2 est exécutée pendant que la tâche 3 attend la complétion de la tâche 2. Pour l'exécution asynchrone, les 3 tâches sont exécutées séquentiellement mais leur exécution ne dépend pas de la complétion de la tâche précédente.

![](https://assets-datascientest.s3-eu-west-1.amazonaws.com/python_avance/async_im1.png)

##### Quelle utilité? 

La programmation asynchrone permet d'accélérer le temps d'exécution et également d'augmenter la réactivité d'un programme puisqu'elle le rend plus adaptatif: on parle de scalabilité.


### 2. La programmation asynchrone sur Python

La gestion de la programmation asynchrone sur Python est particulière puisqu'elle demande de prendre en compte le GIL, Global Interpreter Lock en anglais, verrou qui assure un accès unique à l'interpréteur Python pour une question de gestion de mémoire. En effet, puisque les threads qui composent un même processus partagent la même mémoire, ce verrou permet d'éviter les erreurs générées par ces accès concurrentiels.

Bien que la création de plusieurs threads soit une des façons les plus répandues de gérer la programmation asynchrone, il existe d'autres moyens d'y parvenir. L'utilisation des coroutines avec une syntaxe **_async_**/**_await_** est une des solutions privilégiée. Il est important de noter qu'une coroutine appartient à un thread et qu'un thread appartient à un processus comme l'illustre l'exemple ci-dessous.

![](https://assets-datascientest.s3-eu-west-1.amazonaws.com/python_avance/async_im2.png)

##### Pourquoi utiliser des coroutines plutôt que des threads? 

Les coroutines permettent de réaliser de la programmation concurrente en minimisant les temps alloués au "_context-switching_" induit par la présence de plusieurs threads. Il sera moins coûteux en mémoire et en temps de créer plusieurs coroutines plutôt que plusieurs threads. Les coroutines ont aussi l'avantage d'être gérées par l'utilisateur tandis que les threads le sont par le système d'exploitation. Il est tout de même à noter que les coroutines sont restreintes à la programmation concurrente et ne peuvent pas, au contraire des threads, être exécutées en parallèle.

#### Coroutines

On utilise le terme coroutine pour définir à la fois les fonctions coroutines et les objets coroutines.

Les coroutines sont des fonctions qui retournent des objets coroutines. La documentation Python définit les coroutines comme une **forme généralisée** de fonction. Ainsi tandis qu'une fonction standard commence son exécution en un point et termine par un autre, les coroutines possèdent plusieurs points d'entrées et de sorties et peuvent également arrêter puis reprendre leur exécution. Les coroutines sont implémentées en utilisant l'instruction `async def` et possèdent leur propre syntaxe.

Les fonctions standards en Python sont également appelées subroutines ou procédures. Elles sont définies par l'instruction `def`. La syntaxe d'une fonction est celle-ci:

```python
def nom_de_la_fonction(liste_de_paramètres):
        instruction_n°1
        instruction_n°2
             ...
        instruction_n°k
```

Les paramètres ou encore arguments d'une fonction sont spécifiés au sein de parenthèses, il peut y en avoir un ou plusieurs comme aucun. Une fonction peut également prendre comme argument une autre fonction, ces fonctions sont appelées fonction de rappel ou "_callback_" en anglais. Les instructions correspondent au corps de la fonction et sont indentées.  
  
On dira que l'on **appelle** une fonction lorsque l'on demande son exécution en écrivant le nom de la fonction suivi de parenthèses comprenant ses paramètres comme suit : `nom_de_la_fonction(liste_de_paramètres)`

Nous allons introduire la librairie `asyncio` qui a pour vocation de faciliter la mise en place de la programmation concurrentielle sur Python grâce à la syntaxe **_async/await_**.

Afin de mieux comprendre le fonctionnement de la librairie il est important de définir ce qu'est un objet **attendable**, ou awaitable en anglais. On parle d'objet attendable pour désigner des objets qui sont utilisables avec l'expression _await_. Les coroutines sont des attendables mais il existe deux autres sortes d'attendables : les tâches et les futures. Tandis que les tâches, tasks en anglais, permettent la planification des coroutines et ainsi leur exécution concurrente, les futures désignent les résultats d'une opération asynchrone, telle que le résultat d'une coroutine. Au sein de ce notebook nous verrons les implémentations pour des coroutines et des tâches.

Puisque cela reste très abstrait, nous allons passer en revue différentes implémentations de coroutines de la librairie asyncio afin de concrétiser leurs utilisations. Nous implémentons dans un premier temps une coroutine très simple qui affiche la phrase **"Nous essayons les coroutines."**.

Les coroutines ne peuvent pas être appelées de la même façon que les fonctions standards sur Python. Lorsque l'on appelle une coroutine cela retourne un objet coroutine.

```python
import asyncio
import time

# On crée notre première coroutine

async def exemple():  # On définit la coroutine avec async def

    print("Nous essayons les coroutines.")
    
exemple()
```

Une **boucle d'évènements ou event loop** correspond selon la documentation Python au centre d'exécution fourni par asyncio. Au travers de la boucle d'évènements, les tâches asynchrones sont programmées et exécutées par itération. C'est donc grâce à cette boucle d'évènements que l'exécution concurrentielle est permise: chaque coroutine est exécutée jusqu'à ce que l'instruction _await_ suivi d'un **attendable** est rencontrée où un résultat potentiel est attendu. Il est alors permis d'utiliser ce temps d'attente pour exécuter autre chose au sein de la boucle d'évènements, ce qui permet de rentabiliser ce temps d'attente.

![](https://assets-datascientest.s3-eu-west-1.amazonaws.com/python_avance/async_im3.png)

Une coroutine est appelée au travers d'une event loop. La fonction `run()` est destinée à l'exécution des coroutines. La syntaxe est celle-ci: `asyncio.run(exemple())`![](https://assets-datascientest.s3-eu-west-1.amazonaws.com/python_avance/async_im4.png)

Puisque nous travaillons sur Jupyter Notebook, la syntaxe y est quelque peu différente. En effet, une event loop est déjà en cours d'exécution et cela est propre à Jupyter. Pour obtenir des résultats identiques au sein d'un notebook Jupyter il suffit d'utiliser une autre syntaxe pour appeler la coroutine. Il convient d'appeler la coroutine à l'aide de `await`.

Exécutez la cellule suivante pour obtenir la sortie de la coroutine.

```python
await exemple()
```

Toutes les cellules de code qui suivent auront une durée de complétion assez longue (~ 1 minute).

Considérons la fonction `sleep` de la librairie `time` et la coroutine `sleep` de la librairie `asyncio`, tandis que la première est **bloquante**, la deuxième est **non bloquante**. Cela signifie que ce temps d'attente pourra être exploité pour la réalisation d'autres tâches.

Dans la cellule ci-dessous nous implémentons une fonction qui prend en argument un prénom et qui l'affiche après 10 secondes d'attente. Dans la première partie de la cellule nous utilisons des fonctions standards et dans la deuxième des coroutines. Au sein de la coroutine principale `main` nous appelons la coroutine `nom_async(prenom)` avec différents arguments au sein de la coroutine `gather` qui permet l'exécution concurrente des coroutines.

```python
# Définition de la fonction nom qui en retour affiche le prénom donné en argument après 10 secondes d'attente

def nom(prenom):
    name = prenom
    time.sleep(10)
    print(name)

# Définition de la fonction main qui affiche le temps de complétion de l'exécution
# de la fonction nom pour trois arguments différents


def main():
    print("Subroutine :")
    start_time = time.time()
    nom('Daniel')
    nom('Donna')
    nom('Diane')
    end_time = time.time()
    print("Durée totale d'exécution: %.2f secondes" % (end_time - start_time))


main()

# Définition de la coroutine nom qui en retour affiche le prénom donné en argument après 10 secondes d'attente


async def nom_async(prenom):
    name = prenom
    await asyncio.sleep(10)
    print(name)

# Définition de la coroutine main qui affiche le temps de complétion de l'exécution
# de la fonction nom pour trois arguments différents


async def main():
    print("\nCoroutine :")
    start_time = time.time()
    await asyncio.gather(nom_async('Daniel'), nom_async('Donna'), nom_async('Diane'))
    end_time = time.time()
    print("Durée totale d'exécution: %.2f secondes" % (end_time - start_time))

await main()

# On constate que le temps d'exécution est divisé par trois.
```

```
Subroutine :
Daniel
Donna
Diane
Durée totale d'exécution: 30.03 secondes

Coroutine :
Daniel
Donna
Diane
Durée totale d'exécution: 10.01 secondes
```

Il est également possible d'exécuter de façon concurrentielle plusieurs coroutines en créant des **tâches** comme énoncé plus haut. La syntaxe est décrite dans la cellule suivante. Nous définissons deux fonctions: une fonction `nom` et une fonction `calcul`. La première affiche le prénom Daniel après un temps d'attente de 10 secondes et la seconde affiche les deux premiers chiffres d'un calcul. Nous procédons comme pour la précédente cellule nous affichons les résultats pour une fonction `main` standard et pour une coroutine `main`. Nous exécutons la fonction nom une unique fois et la fonction calcul pour deux arguments différents.

```python
# Définition de la fonction name qui en retour affiche le prénom Daniel

def name():
    name = "Daniel"
    time.sleep(10)
    print(name)

# Définition de la fonction calculation qui en retour affiche les deux premiers chiffres d'un calcul


def calculation(x):
    x = x**1000000
    y = int(str(x)[:2])
    print(y)

# Définition de la fonction main qui affiche le temps de complétion de l'exécution
# de la fonction name et de la fonction calculation pour deux arguments différents


def main():
    print("Subroutine :")
    start_time = time.time()
    name()
    calculation(5)
    calculation(3)
    end_time = time.time()
    print("Durée totale d'exécution: %.2f secondes" % (end_time - start_time))


main()

# Définition de la coroutine name_async qui en retour affiche le prénom Daniel


async def name_async():
    name = "Daniel"
    await asyncio.sleep(10)
    print(name)

# Définition de la coroutine calculation_async qui en retour affiche les deux premiers chiffres d'un calcul


async def calculation_async(x):
    x = x**1000000
    y = int(str(x)[:2])
    print(y)

# Définition de la fonction main qui affiche le temps de complétion de l'exécution
# de la fonction name_async et de la fonction calculation_async pour deux arguments différents
# On crée une tâche pour l'exécution de chaque fonction, cela permet de lancer l'exécution de façon concurrente


async def main():
    print("\nCoroutine :")
    start_time = time.time()
    task1 = asyncio.ensure_future(name_async())
    task2 = asyncio.ensure_future(calculation_async(5))
    task3 = asyncio.ensure_future(calculation_async(3))

    await task1
    await task2
    await task3

    end_time = time.time()
    print("Durée totale d'exécution: %.2f secondes" % (end_time - start_time))

await main()

# On constate que le temps d'exécution est divisé par deux.
```

```
Subroutine :
Daniel
10
17
Durée totale d'exécution: 20.49 secondes

Coroutine :
10
17
Daniel
Durée totale d'exécution: 10.49 secondes
```

L'utilisation de la coroutine gather et la création de tâches donnent lieu à des résultats très similaires. La création de tâches soumet chaque coroutine à la boucle d'évènements, ainsi l'on peut créer autant de tâches que l'on souhaite et elles y seront exécutées. La différence avec gather réside dans le fait que gather attend la complétion de l'ensemble des coroutines puis retourne leur résultat, ce ne sont plus des tâches individuelles.

### 3. Exercice d'application

A partir du code dans la celulle ci-dessous, implémentez des coroutines qui permettent d'obtenir un temps d'exécution inférieur à celui obtenu avec une programmation synchrone et des fonctions standards. A l'aide de l'API wikipédia, nous souhaitons résumer les pages concernant les coroutines, le threading et la programmation concurrente. Pour cela, nous implémentons une fonction `wiki` qui affiche en retour le résumé d'une page wikipédia, l'argument de la fonction. Nous ajoutons au sein de la fonction un temps d'attente.

```python
# On importe la librairie wikipedia

import asyncio
import wikipedia
import time

# On définit la langue de prédilection

wikipedia.set_lang("fr")

# On définit une fonction qui retourne le résumé de chaque page et qui a des temps d'attente bloquants


def wiki(page):
    time.sleep(6)
    print('\n', wikipedia.summary(page))

# On définit une fonction main pour lancer la fonction avec différents arguments


def main():

    print("Subroutine :")

    start_time = time.time()  # On démarre la mesure du temps

    wiki("Coroutine")

    wiki("Threading")

    wiki("Programmation_concurrente")

    end_time = time.time()  # On arrête la mesure du temps

    print("\nDurée totale d'exécution: %.2f secondes" %
          (end_time - start_time))

# On appelle la fonction main


main()


import asyncio
import wikipedia
import time

wikipedia.set_lang("fr")


async def wiki_async(page):
    await asyncio.sleep(6)
    print('\n', wikipedia.summary(page))

# On définit la coroutine main pour lancer les coroutines simultanément grâce à la coroutine gather


async def main():

    print("Coroutine :")

    start_time = time.time()  # On démarre la mesure du temps

    await asyncio.gather(wiki_async("Coroutine"), wiki_async("Threading"), wiki_async("Programmation_concurrente"))

    end_time = time.time()  # On arrête la mesure du temps

    print("\nDurée totale d'exécution: %.2f secondes" %
          (end_time - start_time))

# On appelle la coroutine main

await main()

# On constate bien un gain de temps substantiel entre les deux méthodes.
```


