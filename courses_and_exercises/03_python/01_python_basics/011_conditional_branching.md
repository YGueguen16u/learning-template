

# Intro



Créez un fichier json drilling_machine3.json, et ajoutez lui ce code:

- Drilling_machine3.json
    
    ```json
    {
      "machine_id": "DM-3",
      "name": "Land Rover 2000",
      "location": {
        "latitude": 38.7749,
        "longitude": -104.909,
        "region": "San Diego Basin",
        "country": "USA"
      },
      "status": "Active",
      "specifications": {
        "type": "Onshore",
        "depth_capacity_miles": 6,
        "drilling_speed_miles_per_day": 0.2,
        "crew_size": 22,
        "power_source": "Electric"
      },
      "last_maintenance_date": "2024-06-22",
      "next_maintenance_due": "2025-01-03",
      "contact_information": {
        "operator_company": "Pacific Drilling Inc.",
        "contact_person": "Smith John",
        "phone": "+1-555-123-4567",
        "email": "john.smith@oceanicdrilling.com"
      }
    }
    ```
    

Question: que se passerait-il si on ouvrait ce fichier et qu’on le passait dans l’ensemble des fonctions du module qu’on a créé un peu plus tôt dans le cours ?

- Hint
    
    Si vous n’arrivez pas à trouver le piège, exécutez le code. Pour rappel, voici le module:
    
    ```python
    """
    This module provides utility functions to manipulate and format machine data.
    
    The functions include:
    - Converting specifications from miles to meters.
    - Reformatting date fields to a more readable format.
    - Adding a placeholder contact information structure.
    - Standardizing machine IDs by ensuring numerical parts are zero-padded.
    
    Each function takes a dictionary representing a machine's data and returns the modified dictionary.
    """
    
    from typing import Dict
    
    def convert_miles_to_meters(machine: Dict) -> Dict:
        """
        Converts specifications from miles to meters for a given machine.
    
        This function updates the following fields in the "specifications" sub-dictionary:
        - `depth_capacity_miles` is converted to `depth_capacity_meters`.
        - `drilling_speed_miles_per_day` is converted to `drilling_speed_meters_per_day`.
    
        The original fields in miles are removed after conversion.
    
        Parameters:
        machine (Dict): A dictionary representing the machine data. 
                        Expected to have a "specifications" key containing mile-based fields.
    
        Returns:
        Dict: The updated machine dictionary with values in meters.
        """
        specs = machine["specifications"]
    
        depth_capacity_miles = specs["depth_capacity_miles"]
        depth_capacity_meters = depth_capacity_miles * 1609  # 1 mile = 1609 meters
        specs["depth_capacity_meters"] = depth_capacity_meters
    
        drilling_speed_miles_per_day = specs["drilling_speed_miles_per_day"]
        drilling_speed_meters_per_day = drilling_speed_miles_per_day * 1609
        specs["drilling_speed_meters_per_day"] = drilling_speed_meters_per_day
    
        # Remove fields with miles
        del specs["depth_capacity_miles"]
        del specs["drilling_speed_miles_per_day"]
    
        return machine
    
    def convert_dates(machine: Dict) -> Dict:
        """
        Reformats date fields in a machine dictionary.
    
        This function updates the following fields:
        - `last_maintenance_date`: Converts from "YYYY-MM-DD" to "DD/MM/YYYY".
        - `next_maintenance_due`: Converts from "YYYY-MM-DD" to "DD/MM/YYYY".
    
        Parameters:
        machine (Dict): A dictionary representing the machine data. 
                        Expected to contain date fields in the format "YYYY-MM-DD".
    
        Returns:
        Dict: The updated machine dictionary with reformatted date fields.
        """
        last_maintenance_date = machine["last_maintenance_date"]
        machine["last_maintenance_date"] = "/".join(last_maintenance_date.split("-")[::-1])
    
        next_maintenance_due = machine["next_maintenance_due"]
        machine["next_maintenance_due"] = "/".join(next_maintenance_due.split("-")[::-1])
    
        return machine
    
    def add_contact_info(machine: Dict) -> Dict:
        """
        Adds placeholder contact information to the machine dictionary.
    
        This function adds a `contact_information` field containing:
        - `operator_company`: Placeholder for the operator company (default `None`).
        - `contact_person`: Placeholder for the contact person (default `None`).
        - `phone`: Placeholder for the phone number (default `None`).
        - `email`: Placeholder for the email address (default `None`).
    
        Parameters:
        machine (Dict): A dictionary representing the machine data.
    
        Returns:
        Dict: The updated machine dictionary with the contact information added.
        """
        machine["contact_information"] = {
            "operator_company": None,
            "contact_person": None,
            "phone": None,
            "email": None,
        }
    
        return machine
    
    def format_machine_id(machine: Dict) -> Dict:
        """
        Formats the machine ID to standardize its format.
    
        This function ensures that the numerical part of the `machine_id` is zero-padded to 3 digits.
        For example:
        - "ABC-1" becomes "ABC-001".
        - "DEF-12" becomes "DEF-012".
    
        Parameters:
        machine (Dict): A dictionary representing the machine data.
                        Expected to contain a `machine_id` field in the format "LETTERS-NUMBER".
    
        Returns:
        Dict: The updated machine dictionary with the formatted machine ID.
        """
        id_letters, id_number = machine["machine_id"].split("-")
    
        id_number_zfilled = id_number.zfill(3)
        machine_id = f"{id_letters}-{id_number_zfilled}"
        machine["machine_id"] = machine_id
    
        return machine
    
    ```
    
    Et voici le fichier `main.py` qui exécute l’ensemble: N’oubliez pas de changer drilling_machine2 par drilling_machine3 dans le code pour changer le fichier modifié.
    
    ```python
    import json
    from drill_utils import (
        convert_miles_to_meters,
        convert_dates,
        add_contact_info,
        format_machine_id,
    )
    
    file_to_read = "drilling_machine3.json"
    file_to_write = f"updated_{file_to_read}.json"
    
    with open(file_to_read, "r") as f:
        drilling_machine = json.load(f)
    
    drilling_machine = convert_miles_to_meters(drilling_machine)
    drilling_machine = convert_dates(drilling_machine)
    drilling_machine = add_contact_info(drilling_machine)
    drilling_machine = format_machine_id(drilling_machine)
    
    print(drilling_machine)
    
    with open(file_to_write, "w") as f:
        json.dump(drilling_machine, f)
    
    ```
    
- Solution
    
    Comme vous l’avez sans doute remarqué, les contact_informations du fichier ont été écrasées par notre fonction add_contact_info…
    
    > C’est hyper chiant ! Ca veut dire qu’on va devoir faire un fichier [`main.py`](http://main.py) différent pour chaque fichier json qu’on veut modifier ?
    
    Certainement pas 😉. Il y a une manière plus programmatique de procéder. On appelle ça les conditions. Et c’est ce qu’on va voir ensuite ! Mais d’abord, il faut qu’on fasse un petit détour par un nouveau type: les booléens.
    

# Booleans et opérateurs de comparaison

Les booléens sont une classe particulière qui est renvoyée lorsque vous comparez des valeurs entre elles.

Vous pouvez comparer des objets entre eux en utilisant des _opérateurs de comparaison_ et des _opérateurs logiques_.

> Des quoi ?!

Un exemple vaut mille mots. Ouvrez un terminal et tapez :

```python
1 == 1

1 == 2

2 > 1

1 > 1

1 >= 1

1 != 2

```

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/ff8c7db2-c3f7-4f1d-85c9-674bddcdcbd3/60de6742-86ef-4c41-8f2f-eab4045d1ab9/image.png)

💡 `==, !=, > et < sont des opérateurs de comparaison.

grâce à eux, on peut comparer un objet avec un autre, et Python va nous renvoyez un Booléen (True ou False).

Grâce à eux, on va pouvoir dire à python d’exécuter des instructions seulement si une certaine condition est remplie.


Plus haut, je vous ai dit qu’il y avait aussi des opérateurs logiques. Comme je n’ai pas envie de vous donner toute une liste de nouveaux trucs d’un coup, on en reparlera un peu plus tard ;)

Exercices

- Comparez 1 et “one”. Que renvoie Python ?
    
    False: en anglais, 1 et one c’est la même chose. Mais ça n’est pas ça que compare Python.
    
- Comparez 1 et 1.0. Que renvoie Python ?
    
    True: 1 et 1.0 n’ont pas le même type (l’un est un INT, l’autre un FLOAT) mais ils ont la même valeur.
    

<aside> ⚠️

Bon à savoir ! Parfois, vous voudrez exécuter un morceau de code particulier quand une condition n’est _pas_ vraie.

Dans ce cas de figure, vous pouvez “_inverser”_ votre boolean avec le keyword “not”.

Essayez de taper “not True” et “not False” dans le terminal, pour voir le résultat.

</aside>

Maintenant qu’on a découvert les opérateurs de comparaison, on va pouvoir **exécuter du code en fonction de si une comparaison est vraie ou fausse !**

```python
food = ["apples", "banana", "tomato"]

print("banana" in food)
print("apple" in food)
print("key" in {"key": "value"})
print("value" in {"key": "value"})
```

# if…

On peut tout à fait dire à Python de n’exécuter une certaine partie du code QUE si une condition est remplie. Voici un exemple:

```python
greeting = "Hello There"

friend = "Joey"

if friend == "Joey":
    greeting = "How you doin' ?"
    
if friend == "Rachel":  # False
    greeting = "Hey you !"

print(greeting)
```

Le code ci-dessus va affichier “How you doin’”.

Essayez de remplacer “Joey” par “Rachel” à la ligne 3. Que se passe-t’il ?

- Réponse

`"Hey you !"`

⚠️ **ATTENTION :** Python est, comme on dit, “sensible à la casse”. Essayez de remplacer “Joey” par “rachel” (avec un r minuscule) dans le snippet de code plus haut. Que se passe-t-il ?

- Réponse
    1. d’abord, “Hello there” est assignée à la variable greeting
        
    2. ensuite, “rachel” (r minuscule) est assignée à la variable friend
        
    3. On check si friend == “Joey”. Ce n’est pas le cas, on passe à la suite
        
    4. On check si friend == “Rachel”. Comme on a mis “rachel” et pas “Rachel”, **ça n’est pas le cas non plus !** Pareil: on passe à la suite
        
    5. On print le greeting, qui est toujours égal à…
        
        `Hello there`
        

Derrière le rideau, python vérifie que votre condition s’évalue à True.

exemple:

```python
ma_condition = "whatever"
print(ma_condition == "whatever")

if ma_condition == "whatever":
    print("la condition est vraie, le code est exécuté").
```

Vous pourriez donc utiliser True ou False dans votre if statement:

```python
if True:
    print("yo")  # ce code va s'afficher.
    
if False:
    print("what's up ?")  # ce code ne s'affichera pas
```

Du coup, vous pouvez aussi mettre l’évaluation de votre condition dans une variable, et utiliser cette variable dans votre if statement:

```python
ma_condition = "whatever"
test = ma_condition == "whatever"
print(test)  # True

if test:
    print("yo")
```

Pratique + rappel: vous vous rappelez de la fonction input() qu’on a mentionné rapidement ? Elle prends l’input d’un utilisateur pour l’insérer dans le code python:

```python
user_variable = input("type in your age: ")

print(f"you are {user_variable} years old")
```


Ecrivez une fonction qui calcule si l’âge entré est un nombre pair et print un message spécial

- Indice: rappel sur comment transformer une string en int
    
    ```python
    user_var = input()
    print(type(user_var))
    
    user_var2 = input()
    print(type(int(user_var))
    ```
    
- Solution
    
    ```python
    user_var = input("enter a number: ")
    
    if int(user_var) % 2 == 0:
        print("even")
    
    print("if you didn't get a message, your age is not even")
    ```
    
    ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/ff8c7db2-c3f7-4f1d-85c9-674bddcdcbd3/eeceb04e-3508-42c8-8e6b-1ca5440f66a7/image.png)
    

⚠️ Notions avancées !

Evidemment, si l’utilisateur de votre logiciel décide de faire n’importe quoi, votre programme va planter. Essayez de relancer le programme, mais cette fois-ci, entrez “sbradaravdjan”


Evidemment, au moment où vous demandez à Python de transformer “sbradaravdjan” en int, ça plante !


Plus tard, on verra comment:

1. éviter de faire planter Python s’il est impossible de transformer l’input de l’utilisateur en int, avec la syntaxe **try / except**
2. vérifier qu’un objet est une instance d’une certaine classe, pour effectuer des opérations uniquement dans ce cas de figure, avec la fonction **isinstance()**.

Mais pour l’instant, on va faire _comme si_ l’utilisateur était intelligent et respectait toujours les consignes (après tout, pour l’instant, l’utilisateur c’est vous ^^)


### **Problème !**

Vous l’avez peut-être remarqué, mais notre programme est un peu “clunky” / déglingué… Si le nombre entré par l’utilisateur est impair, le programme renvoie ça:

> if you didn't get a message, your age is not even

Par contre, si le nombre entré par l’utilisateur est pair, le programme renvoie ça:

> even if you didn't get a message, your age is not even

- Revoir le code
    
    ```python
    user_var = input("enter a number: ")
    
    if int(user_var) % 2 == 0:
        print("even")
    
    print("if you didn't get a message, your age is not even")
    ```
    
    

---

Vous vous dites peut-être qu’il doit y avoir un moyen d’exécuter du code si une condition est remplie, et **sinon, d’exécuter autre chose.**

Et effectivement, on peut faire ça, avec la syntaxe if / else, qu’on va voir tout de suite 🙂

# if… else

“else” est juste un autre keyword en python que vous pouvez utiliser à la suite d’un if, au même niveau d’indentation.


Exemple - analysez le code suivant. A votre avis, que va-t-il produire comme résultat ?

```python
worthy = "No"

if worthy == "yes !":
    print("Thor picked up the Hammer")
else:
    print("The avenger could not lift the Hammer")
 
print("fight !")
```

- Réponse
    
    Etant donné que worthy = “No”, on exécute le bloc de code situé _après_ le else.
    
    Note: Le print(”fight !”) est exécuté dans tous les cas 🙂
    
    résultat:
    
    > The avenger could not lift the Hammer fight !
    

Exercice: écrivez une fonction qui calcule si l’âge entré est un nombre pair et print un message différent selon que l’âge est pair ou impair

- Solution
    
    ```python
    user_var = input("enter a number: ")
    
    if int(user_var) % 2 == 0:
        print("even")
    else:
    		print("odd")
    ```
    

# if… elif … else

A votre avis, que produit le code suivant ?

```python
worthy = "No"
thanos_here = True

if worthy == "yes !":
    print("Thor picked up the Hammer")
elif thanos_here == True:  # le == True est superflu ici, essayez sans pour voir ;)
		print("Captain America picked up the Hammer")
else:
    print("The avenger could not lift the Hammer")
 
print("fight !")
```

- réponse
    
    Etant donné que worthy = “No”, on passe à la suite.
    
    Ensuite, on regarde si thanos_here est vrai. Comme c’est le cas, on exécute le bloc de code situé sous le “elif”.
    
    Comme l’une des deux conditions (if ou elif) était vraie, python n’exécute pas la partie du code qui se trouve sous le else.
    
    Note: Le print(”fight !”) est exécuté dans tous les cas 🙂
    
    résultat:
    
    > "Captain America picked up the Hammer" fight !
    
    

**Exercice**: créez un petit programme qui dit à l’utilisateur s’il a le droit à un tarif SNCF.

---

Tarification SNCF:

Jusqu’à 27 ans: Carte Avantage Jeune. 49€ / an: 30% garantis sur tous les trains TGV INOUI et INTERCITÉS en 2ᵈᵉ et 1ʳᵉ classe

Entre 27 et 59 ans: Carte Avantage Famille. 49€ / an: réduction de 30 % sur le prix du billet.

60 ans et +: Carte avantage Senior. 49€ / an: **- 30% sur vos voyages toute l'année en 2nde et en 1ère ;**

---

😂 Je vous jure que j’invente rien. j’ai découvert en faisant cet exercice que la SNCF propose une carte à 49€ à toutes les tranches d’âge. La carte fait à chaque fois peu ou prou la même réduction (-30% sur le prix du billet), avec des trucs en plus pour les seniors comme **60% sur les billets de 3 enfants accompagnants par trajet;**


**Pour l’exercice, contenez vous de dire à quelle carte avantage l’utilisateur a accès en fonction de son âge ;)**

- Solution
    
    ```python
    user_var = int(input("enter a number: "))  # int() ici pour pas le répéter 
    
    if user_var <= 27:
        print("Carte Avantage Jeune")
    elif user_var > 27 and <= 60:  # vous pouvez checker deux conditions avec and
        print("Carte Avantage Adulte")
    else:
    		print("Carte Avantage Senior")
    ```
    
⚠️ J’ai profité de la situation pour vous montrer comment checker deux conditions en une seule ligne avec le keyword and Mais ici, il n’est pas nécessaire de checker que user_var est supérieur à 27. Si ce n’était pas le cas, la première condition aurait été remplie et on serait sorti du bloc if/elif/else.
    
Pour ceux qui apprécient la philosophie de la répétition: testez le programme avec et sans la condition user_var > 27.


Maintenant que j’ai introduit le concept, on va le pratiquer davantage


# Bonus Culture générale

Bonus culture générale:

Le célèbre poème “If” de Rudyard Kipling (l’auteur du livre de la jungle).


Traduction:

| If you can keep your head when all about you Are losing theirs and blaming it on you, If you can trust yourself when all men doubt you, But make allowance for their doubting too; If you can wait and not be tired by waiting, Or being lied about, don't deal in lies, Or being hated, don't give way to hating, And yet don't look too good, nor talk too wise:

If you can dream - and not make dreams your master; If you can think - and not make thoughts your aim; If you can meet with Triumph and Disaster And treat those two impostors just the same; If you can bear to hear the truth you've spoken Twisted by knaves to make a trap for fools, Or watch the things you gave your life to, broken, And stoop and build 'em up with worn-out tools:

If you can make one heap of all your winnings And risk it on one turn of pitch-and-toss, And lose, and start again at your beginnings And never breathe a word about your loss; If you can force your heart and nerve and sinew To serve your turn long after they are gone, And so hold on when there is nothing in you Except the Will which says to them: 'Hold on!'

If you can talk with crowds and keep your virtue, ' Or walk with Kings - nor lose the common touch, if neither foes nor loving friends can hurt you, If all men count with you, but none too much; If you can fill the unforgiving minute With sixty seconds' worth of distance run, Yours is the Earth and everything that's in it, And - which is more - you'll be a Man, my son! | Si tu peux voir détruit l’ouvrage de ta vie Et sans dire un seul mot te mettre à rebâtir, Ou perdre en un seul coup le gain de cent parties Sans un geste et sans un soupir ;

Si tu peux être amant sans être fou d’amour, Si tu peux être fort sans cesser d’être tendre, Et, te sentant haï, sans haïr à ton tour, Pourtant lutter et te défendre ;

Si tu peux supporter d’entendre tes paroles Travesties par des gueux pour exciter des sots, Et d’entendre mentir sur toi leurs bouches folles Sans mentir toi-même d’un mot ;

Si tu peux rester digne en étant populaire, Si tu peux rester peuple en conseillant les rois, Et si tu peux aimer tous tes amis en frère, Sans qu’aucun d’eux soit tout pour toi ;

Si tu sais méditer, observer et connaître, Sans jamais devenir sceptique ou destructeur, Rêver, mais sans laisser ton rêve être ton maître, Penser sans n’être qu’un penseur ;

Si tu peux être dur sans jamais être en rage, Si tu peux être brave et jamais imprudent, Si tu sais être bon, si tu sais être sage, Sans être moral ni pédant ;

Si tu peux rencontrer Triomphe après Défaite Et recevoir ces deux menteurs d’un même front, Si tu peux conserver ton courage et ta tête Quand tous les autres les perdront,

Alors les Rois, les Dieux, la Chance et la Victoire Seront à tout jamais tes esclaves soumis, Et, ce qui vaut mieux que les Rois et la Gloire Tu seras un homme, mon fils. | | --- | --- |

# Les keywords and et or

Exécutez le code suivant:

```python
1 == 1 and 2 == 2

1 == 1 and 2 == 3

1 == 1 or 2 == 3

1 == 2 or 2 == 3
```

Qu’en déduisez vous ?

- voir le résultat
    

⚠️ Vous aurez peut-être parfois besoin de vérifier si deux conditions sont vraies.

Pour ça, vous pouvez utiliser le keyword _and:_

```python
True and True  # renvoie True
True and False  # renvoie False même si un seul des deux booléens est False
```

Et parfois, vous aurez besoin de vérifier si _au moins_ une des deux conditions est remplie.

Pour ça, vous pouvez utiliser le keyword of*:*

```python
True or False  # renvoie True même si un seul des deux booléens est True
False or False  # aucun des deux n'est True: renvoie False 
```


Exercice:

Créez un système d’accès en posant 3 questions à votre utilisateur:

- Entrez votre âge:
- Avez-vous une carte d’identité valide ? (oui/non):
- Avez-vous une carte de membre ? (oui/non):

Si la personne a moins de 18 ans, interdire l’accès. Sinon, si elle a plus de 18 ans:

- vérifier que ci_valide est vrai. Si oui: donner l’accès.
    
- si la personne a une carte de membre, pas besoin de vérifier son âge ou sa ci (ça a été fait lors de l’inscription)
    
- Si aucune des deux conditions ci-dessus n’est validée, refuser l’accès.
    
- Solution 1 (la plus _intuitive)_
    
    ```python
    age = int(input("Entrez votre âge: "))  
    ci_valide = input("Ccarte d’identité valide ? (oui/non): ").strip().lower()
    membre = input("Carte de membre ? (oui/non): ").strip().lower()
    
    if age < 18:
        print("Trop jeune")
    elif (age >= 18 and has_id == "oui")
        print("Accès autorisé")
    elif has_membership == "oui":
        print("Accès autorisé")
    else:
        print("Accès refusé")
    ```
    
- Solution 2 (la plus _compressée / élégante_)
