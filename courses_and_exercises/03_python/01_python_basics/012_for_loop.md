Souvent, en informatique, on veut exécuter la même instruction plusieurs fois consécutives.

Par exemple:

> Dis Python, j’aimerais que tu me calcules le Chiffre d’Affaires total, _pour chaque magasin_

ou:

> J’ai 2000 images dans mon répertoire. J’aimerais que, _pour chaque image_, tu me l’ouvres, tu regardes ce qu’il y a dedans pour voir si cette image contient une photo de mon chien, si c’est le cas tu la stocke quelque part, sinon tu passes à la suite

ou encore:

> On a 150 fichiers clients dans la base. _Pour chaqu’un d’entre eux_, vérifie qu’ils ont été actif au moins une fois lors des 3 derniers mois. Sinon, on archive leurs données pour des raisons RGPD

L’instruction pour faire la vérification est toujours la même. On ne va pas répéter le code 150 fois !!

A la place, on utilise une boucle for (”for loop” en anglais):

```python
my_list = ["banana", "apple", "carrot"]

for item in my_list:
    print(item)
```

```python
def faire_le_bilan(client_name):
    if client_name == "Jacky":
        print(f"{client_name}: on fait le bilan, calmement")
    elif client_name == "Benji":
        print(f"{client_name}: s'remémorant chaque instant")
    else:
        print("Parler des histoires d'avant comme si on avait 50 ans !")

liste_clients = ["Jacky", "Benji", "Coeur"]

for client in liste_clients:
    faire_le_bilan(client)
```

Structure d’une boucle for (”for loop” en anglais)

![[14_01.png]]

Notez que, comme pour les if/else, tout est lié à l’indentation.

Par exemple le code suivant va planter:

```python
for z in [1, 2, 3]:
    print(z)
        print("hello")  # indentation supplémentaire sans raison
```




### Quelques observations:

Essayez le code suivant:

```python
for z in [1, 2, 3]:
    print(z)
```

- Observation
    
    vous voyez que le nom de variable qu’on utilise est entièrement libre
    

Ensuite, essayez le code suivant:

```python
for nom_random in range(1):
    print("salut")
```

- Observation
    
    Vous voyez qu’on n’a pas forcément besoin d’utiliser la variable dans la boucle.
    
Pro’ tip: Dans ce cas là, pour montrer aux autres utilisateurs de votre code que les items ne seront pas ré-utilisés, vous pouvez utiliser un underscore _ comme nom de variable:
    
```python
for _ in [1, 2, 3]:
	print("salut")
```
    
    

### Exercices:

- Exercice: faites une boucle for avec un dictionnaire. Que se passe-t-il ?
    
    ```python
    contact_informations = {
        "operator_company": "Pacific Drilling Inc.",
        "contact_person": "Smith John",
        "phone": "+1-555-123-4567",
        "email": "john.smith@oceanicdrilling.com",
    }
    
    for test in contact_informations:
        print(test)
    ```
    
Par défaut, itérer avec une boucle sur un **dictionnaire** revient à itérer sur les _**clefs**_ de celui-ci.
    
- Exercice: utilisez .values() pour itérer sur les valeurs du dictionnaire
    
```python
contact_informations = {
	"operator_company": "Pacific Drilling Inc.",
	"contact_person": "Smith John",
	"phone": "+1-555-123-4567",
	"email": "john.smith@oceanicdrilling.com",
}

for test in contact_informations.values():
	print(test)
```
    
- Exercice: utilisez .items() pour itérer sur les clés ET les valeurs du dictionnaire:
    
    ```python
    contact_informations = {
        "operator_company": "Pacific Drilling Inc.",
        "contact_person": "Smith John",
        "phone": "+1-555-123-4567",
        "email": "john.smith@oceanicdrilling.com",
    }
    
    for test in contact_informations.items():
        print(test)
        print(f"clé: {test[0]}, valeur: {test[1]}")
        
    # pro tip:
    # passez un peu de temps à essayer de comprendre ce qu'il se passe ici ;)
    for key, value in contact_information.items():
        print(f"clé: {key}, valeur: {value}")
    ```
    
- Exercice: faites une boucle for sur une string. Que se passe-t-il ?
    
```python
for letter in "kayak":
	print(letter)
```
    
Comment savoir si vous pouvez itérer sur un objet python ?

Essayez le code suivant dans un petit fichier python à part (ou directement en ligne de commande)

```python
objet = ____  # mettez ce que vous voulez: une str, un int, un tuple, un dict...

iterable = iter(objet)  # si ça plante, vos objet n'est pas iterable ^^
```

Pour plus de détails, see:

[https://stackoverflow.com/questions/1952464/python-how-to-determine-if-an-object-is-iterable](https://stackoverflow.com/questions/1952464/python-how-to-determine-if-an-object-is-iterable)


# Enumerate() and zip()

Regardez attentivement ce code:

```python
i = 0

for item in ["poires", "pommes", "oranges"]:
    print(i)
    print(item)
    i += 1
```

Vouloir indexer ou compter en même temps qu’on itère sur une liste est une opération tellement fréquente que les développeurs de Python ont créé la fonction enumerate pour ça:

```python
for i, item in enumerate(["poires", "pommes", "oranges"]):
    print(i)
    print(item)
```

Vous pouvez aussi utiliser zip() pour itérer sur deux listes en parallèle:

```python
employee_ids = [2, 3, 42]
employee_names = ["Perceval", "Karadoc", "Kadoc"]

# Pour avoir l'id en face du nom, vous pourriez faire comme ça:
i = 0 
for name in employee_names:
    print(employee_ids[i], name)
    i += 1
    
# Exercice: faites la même chose avec enumerate
for i, name in enumerate(employee_names):
    print(employee_ids[i], name)

# Mais python offre une solution plus élégante avec zip():
for employee_id, employee_name in zip(employee_ids, employee_names):
    print(employee_id, employee_name)
```

- Exercice créez une liste countries avec 3 pays, une liste capital_cities avec 3 capitales, et printez chaque capitale en face de chaque pays en utilisant zip
    
    ```python
    countries = ["France", "Belgique", "Tunisie"]
    capital_cities = ["Paris", "Bruxelles", "Tunis"]
    
    for capital, country in zip(capital_cities, countries):
        print(f"{country}: {capital}")
    ```
    
- Exercice: pour le fun, ajoutez un enumerate au code ci-dessus
    
    ATTENTION: exercice non trivial ;)
    
    ```python
    countries = ["France", "Belgique", "Tunisie"]
    capital_cities = ["Paris", "Bruxelles", "Tunis"]
    
    for index, (capital, country) in enumerate(zip(capital_cities, countries)):
        print(f"{country} {index}: {capital}")
    
    # essayez de déconstruire ce code petit morceau par petit morceau 
    # pour comprendre pourquoi il faut ajouter des parenthèses dans ce snippet
    ```
    

Attention: ne jamais, JAMAIS, **JAMAIS** modifier le contenu d’une liste (ou d’un autre itérable) lorsque vous itérez dessus:

![[14_02.png]]

Pouvez-vous deviner ce qu’il s’est passé ? Si vous n’arrivez pas à le visualiser dans votre tête

- Explications
    
    Dans le code suivant, j’ai simulé le fonctionnement de la for loop en utilisant du code python un peu “avancé” (avancé dans le sens où vous n’utiliserez probablement pas souvent iter() et next() au début).
    
    ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/ff8c7db2-c3f7-4f1d-85c9-674bddcdcbd3/8a730158-67f7-4727-95d8-2b68e6bff545/image.png)
    
    Le premier bloc de 4 lignes simule une for loop qui va jusqu’au bout sans problème.
    
    Le 2e bloc (après le restart) simule la for loop avec le del() qu’on avait dans l’exemple ci-dessus.
    
    Vous voyez que quand on supprime un élément de la liste, le next() passe au suivant. Ca permet de découvrir que, lorsque vous itérez sur une liste avec une boucle for, Python ne garde pas l’état original de la liste en mémoire, mais fait juste l’équivalent d’un next(), et si la liste a changé, c’est pour votre pomme !
    
### break
Souvent, l'utilisation d'une boucle implique de parcourir l'ensemble des éléments d'une structure de données. C'est là qu'intervient le mot-clé break qui permet de sortir d'une boucle et de passer à l'instruction suivante. On peut par exemple, l'utiliser pour les boucles for et while lorsqu'une condition spécifique est validée comme cela est visible sur l'exemple ci-dessous :

```python
for i in [10, -1, 30, 40]:
    print(i)
    if i<0:
        print("Il y a au moins un nombre négatif dans la liste")    
        break # On sort de la boucle while dès que i est négatif
```

Dans cet exemple, la boucle for parcourt la liste à la recherche de nombres négatifs. Dès qu’elle en trouve un, elle s’arrête immédiatement. Par exemple, ici, i prendra seulement les valeurs i = 10 et i = -1, car dès que i = -1, l’instruction break interrompt la boucle for.

</aside>

Conclusion:

<aside> 💡

On vient de découvrir ensemble les boucles, qui sont un élément essentiel de la programmation.

Le but de Python, c’est d’automatiser les taches ennuyeuses. Plutôt que de cliquer 50 fois sur le bouton envoyer, vous pouvez prendre une liste de 150 emails et envoyer le même email automatiquement à chaque email avec Python. Vous pouvez même personnaliser l’email.

</aside>

Ce n’est qu’un exemple parmi les innombrables qu’on pourrait trouver.

Un autre “use-case”, c’est de traiter tous les fichiers présents dans un répertoire. Chose que j’ai fait pendant des mois pour mon dernier client. Par conséquent, maintenant qu’on a vu comment faire, on va retourner à notre use-case métier et ouvrir tous les fichiers du répertoire pour les traiter un par un avec le même code !


# Mise en pratique des boucles

# Préparation:

🚨

D’abord, créez un dossier data dans votre répertoire principal (celui où vous avez votre script [main.py](http://main.py))

Si vous avez la flemme de faire ça à la main, copiez-collez le code suivant dans le terminal :

```bash
mkdir data && mkdir data/raw && mkdir data/processed
```

Puis, dans ce dossier data, créez une dossier “raw” et un dossier “processed”

Root/ │ ├── **data**/ │ ├── **raw**/ │ │ ├── drilling_machine1.json │ │ ├── drilling_machine2.json │ │ ├── drilling_machine3.json │ │ ├── drilling_machine4.json │ │ └── drilling_machine5.json │ └──**processed**/ │ └── ├── create_data.py ├── drill_utils.py ├── [main.py](http://main.py) └── README.txt


Créez un script `create_data.py` et copiez y le code suivant:

```python
import json

drilling_machines = [
    {
        "machine_id": "DM-001",
        "name": "Deep Driller 3000",
        "location": {
            "latitude": 29.7355,
            "longitude": -95.3635,
            "region": "Gulf of Mexico",
            "country": "USA",
        },
        "status": "Operational",
        "specifications": {
            "type": "Offshore",
            "depth_capacity_meters": 10000,
            "drilling_speed_meters_per_day": 300,
            "crew_size": 40,
            "power_source": ["Diesel, Electric"],
        },
        "last_maintenance_date": "10/07/2024",
        "next_maintenance_due": "10/12/2024",
        "contact_information": {
            "operator_company": "Oceanic Drilling Inc.",
            "contact_person": "John Smith",
            "phone": "+1-555-123-4567",
            "email": "john.smith@oceanicdrilling.com",
        },
    },
    {
        "machine_id": "DM-2",
        "name": "Land Rover 200",
        "location": {
            "latitude": 37.7749,
            "longitude": -107.909,
            "region": "San Juan Basin",
            "country": "USA",
        },
        "status": "Under Maintenance",
        "specifications": {
            "type": "Onshore",
            "depth_capacity_miles": 7,
            "drilling_speed_miles_per_day": 0.3,
            "crew_size": 25,
            "power_source": "Electric",
        },
        "last_maintenance_date": "2024-07-15",
        "next_maintenance_due": "2025-01-15",
    },
    {
        "machine_id": "DM-3",
        "name": "Land Rover 2000",
        "location": {
            "latitude": 38.7749,
            "longitude": -104.909,
            "region": "San Diego Basin",
            "country": "USA",
        },
        "status": "Active",
        "specifications": {
            "type": "Onshore",
            "depth_capacity_miles": 6,
            "drilling_speed_miles_per_day": 0.2,
            "crew_size": 22,
            "power_source": "Electric",
        },
        "last_maintenance_date": "2024-06-22",
        "next_maintenance_due": "2025-01-03",
        "contact_information": {
            "operator_company": "Pacific Drilling Inc.",
            "contact_person": "Smith John",
            "phone": "+1-555-123-4567",
            "email": "john.smith@oceanicdrilling.com",
        },
    },
    {
        "machine_ID": "DM-4",
        "name": "Land Rover 400",
        "location": {
            "latitude": 37.78,
            "longitude": -107.9092,
            "region": "San Juan Basin",
            "country": "USA",
        },
        "status": "Active",
        "specifications": {
            "type": "Onshore",
            "depth_capacity_meters": 10459.5,
            "drilling_speed_meters_per_day": 434,
            "crew_size": 25,
            "power_source": "Electric",
        },
        "last_maintenance_date": "2024-07-19",
        "next_maintenance_due": "2025-01-19",
        "contact_information": {
            "operator_company": "Pacific Drilling Inc.",
            "contact_person": "Smith John",
            "phone": "+1-555-123-4567",
            "email": "john.smith@oceanicdrilling.com",
        },
    },
    {
        "machine_ID": "DM-05",
        "name": "Land Rover 500",
        "location": {
            "latitude": 37.88,
            "longitude": -107.9192,
            "region": "San Diego Basin",
            "country": "USA",
        },
        "status": "Inactive",
        "specifications": {
            "type": "Onshore",
            "depth_capacity_meters": 8459.5,
            "drilling_speed_meters_per_day": 374,
            "crew_size": 20,
            "power_source": ["Electric", "Diesel"],
        },
        "last_maintenance_date": "2024-07-19",
        "next_maintenance_due": "2025-01-19",
        "contact_information": {
            "operator_company": "Pacific Drilling Inc.",
            "contact_person": "Smith John",
            "phone": "+1-555-123-4567",
            "email": "john.smith@oceanicdrilling.com",
        },
        "type": "C",
    },
]

for i, dm in enumerate(drilling_machines):
    file_name = f"data/raw/drilling_machine{i+1}.json"
    with open(file_name, "w") as f:
        json.dump(dm, f)

```

1. Prenez le temps de lire le code pour comprendre ce qu’il fait (vous avez désormais toutes les connaissances nécessaires pour comprendre le code 😉 )
    - Explications
        1. On importe le module json pour s’en resservir plus bas dans le code
        2. On crée une _liste_ qui contient 5 *dictionnaires. (*Chaque dictionnaire contient les infos d’une foreuse (drilling_machine))
        3. on itère sur cette liste: pour chaque foreuse (drilling_machine, ou dm) dans cette liste de drilling_machineS
            1. on crée le nom du fichier dans lequel on va stocker ces infos
                
            2. grâce à enumerate, le nom du fichier est dynamiquement incrémenté à chaque itération de la boucle (drilling_machine1.json, drilling_machine2.json… etc)
                
                Rappel important: on mets i+1 dans le naming car en Python, l’indexation commence à zéro 🙂
                
            3. avec open (option “w” pour write), et json.dump, on enregistre les informations du dictionnaire dans un fichier json.
                
2. Exécutez ce code pour avoir les 5 fichiers à votre disposition

<aside> 💡

Le but de tout ça était de _préparer_ les exercices suivants.

Au début, j’avais mis les cinq fichiers json à copier/coller.

Puis je me suis dit:

> ce sera beaucoup moins ennuyeux pour eux d’avoir un seul fichier à C/C qui génère la data et la sauvegarde au bon endroit, ET c’est l’occasion de leur montrer l’utilisation d’une boucle !

Vous voyez à quel point Python commence à être intéressant pour automatiser les tâches fastidieuses 😉

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/ff8c7db2-c3f7-4f1d-85c9-674bddcdcbd3/dd8037dd-8763-47a8-82d6-742439cb267a/image.png)

</aside>

# Mise en pratique 1: utilisez une boucle pour ouvrir et print() chaque fichier

Dans `main.py`, créez un script qui:

1. liste les 5 fichiers dans une liste (on n’a pas encore vu comment lister les fichiers présents dans un dossier avec python)
    
    ```python
    # les noms des 5 fichiers:
    data/raw/drilling_machine1.json
    data/raw/drilling_machine2.json
    data/raw/drilling_machine3.json
    data/raw/drilling_machine4.json
    data/raw/drilling_machine5.json
    
    # mettez ça dans une liste python
    ```
    
2. pour chaque fichier présent dans la liste, ouvre le fichier et print() le contenu
    

- Solution
    
    ```python
    import json
    
    files = [
        "data/raw/drilling_machine1.json",
        "data/raw/drilling_machine2.json",
        "data/raw/drilling_machine3.json",
        "data/raw/drilling_machine4.json",
        "data/raw/drilling_machine5.json"
    ]
    
    for drilling_file in files:
        print(drilling_file)
        with open(drilling_file, "r") as f:
            data = json.load(f)
            print(data)
    ```
    

# Mise en pratique 2: utilisez une boucle pour détecter les champs superflus

<aside> 🚧

Dans le fichier drilling_machine5.json, j’ai volontairement ajouté un champ “type” qui contient la valeur “C”.

Parfois, vous recevrez de la part de vos fournisseurs de la Data qui ne vous sert à rien. On va coder un script qui exclut cette Data.

</aside>

Dans `main.py`, créez un script qui:

1. ouvre chaque fichier
    
2. pour chaque fichier, itérer sur les clés du dictionnaire
    
3. pour chaque clé, vérifier qu’elle fait bien partie de la liste suivante (**Si ce n’est pas le cas, trouvez un moyen de supprimer la clé superflue avant de print() la data** 🙂) :
    
    ```python
    expected_keys = [
        "machine_id",
        "machine_ID",
        "name",
        "location",
        "status",
        "specifications",
        "last_maintenance_date",
        "next_maintenance_due",
        "contact_information",
    ]
    ```
    

- Solution
    
    Est-ce que votre code ressemblait à ça ? 🙂
    
    ```python
    import json 
    
    files = [
        "data/raw/drilling_machine1.json",
        "data/raw/drilling_machine2.json",
        "data/raw/drilling_machine3.json",
        "data/raw/drilling_machine4.json",
        "data/raw/drilling_machine5.json"
    ]
    
    expected_keys = [
        "machine_id",
        "machine_ID",
        "name",
        "location",
        "status",
        "specifications",
        "last_maintenance_date",
        "next_maintenance_due",
        "contact_information",
    ]
    
    for drilling_file in files:
        with open(drilling_file, "r") as f:
            data = json.load(f)
    
        for key in data.keys():
            if key not in expected_keys:
                print(f"Unexpected key: {key}")
                del data[key]  # problème !!! 
    
        print(data)
    ```
    
    <aside> 💡
    
    Vous avez peut-être essayé de supprimer la clé pendant l’itération, alors que je vous avait dit de pas le faire au chapitre précédent ^^
    
    J’ai fait exprès de vous glisser ce petit piège dans l’exercice, pour vous rappeler qu***’il ne faut jamais modifier une structure de données sur laquelle on est en train d’itérer !***
    
    Pour résoudre ce problème, il y avait plusieurs options:
    
    </aside>
    
    Option 1: créer une liste à part pour stocker les clés à supprimer et les supprimer dans un second temps :
    
    ```python
    import json
    
    files = [
        "data/raw/drilling_machine1.json",
        "data/raw/drilling_machine2.json",
        "data/raw/drilling_machine3.json",
        "data/raw/drilling_machine4.json",
        "data/raw/drilling_machine5.json"
    ]
    
    expected_keys = [
        "machine_id",
        "machine_ID",
        "name",
        "location",
        "status",
        "specifications",
        "last_maintenance_date",
        "next_maintenance_due",
        "contact_information",
    ]
    
    for file in files:
        with open(file, "r") as f:
            data = json.load(f)
    
        keys_to_delete = []
        for key in data.keys():
            if key not in expected_keys:
                print(f"Unexpected key: {key}")
                keys_to_delete.append(key)
              
        for key_to_del in keys_to_delete:
            del data[key_to_del]
        print(data)
    
    ```
    
    Option 2: créer une copie du dictionnaire et itérer sur les clés de cette copie
    
    ```python
    import json
    
    files = [
        "data/raw/drilling_machine1.json",
        "data/raw/drilling_machine2.json",
        "data/raw/drilling_machine3.json",
        "data/raw/drilling_machine4.json",
        "data/raw/drilling_machine5.json"
    ]
    
    expected_keys = [
        "machine_id",
        "machine_ID",
        "name",
        "location",
        "status",
        "specifications",
        "last_maintenance_date",
        "next_maintenance_due",
        "contact_information",
    ]
    
    for file in files:
        with open(file, "r") as f:
            data = json.load(f)
    
        for key in data.copy().keys():
            if key not in expected_keys:
                print(f"Unexpected key: {key}")
                del(data[key])
    
        print(data)
    
    ```
    

# Mise en pratique 3 (rappel fonctions): extraire la boucle dans une fonction et la mettre dans drill_utils.py

`drill_utils.py`:

```python
from typing import Dict

# EXPECTED_KEYS pourrait être utile dans d'autres fonctions, 
# et / ou être modifié à l'avenir,
# donc autant le mettre au début
EXPECTED_KEYS = [
    "machine_id",
    "machine_ID",
    "name",
    "location",
    "status",
    "specifications",
    "last_maintenance_date",
    "next_maintenance_due",
    "contact_information",
]

def convert_miles_to_meters(machine: Dict) -> Dict:
    specs = machine["specifications"]  # specs: short for specifications

    depth_capacity_miles = specs["depth_capacity_miles"]
    depth_capacity_meters = depth_capacity_miles * 1609  # 1 mile = 1.609km = 1609m
    specs["depth_capacity_meters"] = depth_capacity_meters

    drilling_speed_miles_per_day = specs["drilling_speed_miles_per_day"]
    drilling_speed_meters_per_day = drilling_speed_miles_per_day * 1609
    specs["drilling_speed_meters_per_day"] = drilling_speed_meters_per_day

    del specs["depth_capacity_miles"]
    del specs["drilling_speed_miles_per_day"]

    return machine

def convert_dates(machine: Dict) -> Dict:
    last_maintenance_date = machine["last_maintenance_date"]
    machine["last_maintenance_date"] = "/".join(last_maintenance_date.split("-")[::-1])

    next_maintenance_due = machine["next_maintenance_due"]
    machine["next_maintenance_due"] = "/".join(next_maintenance_due.split("-")[::-1])

    return machine

def add_contact_info(machine: Dict) -> Dict:
    machine["contact_information"] = {
        "operator_company": None,
        "contact_person": None,
        "phone": None,
        "email": None,
    }

    return machine

def format_machine_id(machine: Dict) -> Dict:
    id_letters, id_number = machine["machine_id"].split("-")

    id_number_zfilled = id_number.zfill(3)
    machine_id = f"{id_letters}-{id_number_zfilled}"
    machine["machine_id"] = machine_id

    return machine

# et on ajoute cette nouvelle fonction à la fin
def remove_useless_data(dm_dict: Dict) -> Dict:
    for key in dm_dict.copy().keys():
        if key not in EXPECTED_KEYS:
            del dm_dict[key]
    return dm_dict

```

> euhhh, pourquoi t’as mis EXPECTED_KEYS en majuscules ?

Réponse ici:

[aparté: conventions de code et PEP8](https://www.notion.so/apart-conventions-de-code-et-PEP8-1709064d0b6f80ec9840e6354f78806b?pvs=21)

maintenant qu’on a créé cette fonction, on peut l’utiliser dans `main.py:`

```python
import json
from drill_utils import remove_useless_data

files = [
    "data/raw/drilling_machine1.json",
    "data/raw/drilling_machine2.json",
    "data/raw/drilling_machine3.json",
    "data/raw/drilling_machine4.json",
    "data/raw/drilling_machine5.json",
]

for drilling_file in files:
    with open(drilling_file, "r") as f:
        dm_dict = json.load(f)

    dm_dict = remove_useless_data(dm_dict)

    print(dm_dict)

```

# Mise en pratique 4: pour chaque fichier, l’ouvrir, faire passer toutes les fonctions drill_utils, et l’enregistrer

```python
import json
from drill_utils import (
    remove_useless_data,
    convert_dates,
    convert_miles_to_meters,
    add_contact_info,
    format_machine_id,
)

files = [
    "drilling_machine1.json",
    "drilling_machine2.json",
    "drilling_machine3.json",
    "drilling_machine4.json",
    "drilling_machine5.json",
]

for drilling_file in files:
    in_path = f"data/raw/{drilling_file}"
    out_path = f"data/processed/{drilling_file}"
    with open(in_path , "r") as f:
        dm_dict = json.load(f)

    dm_dict = remove_useless_data(dm_dict)
    dm_dict = convert_dates(dm_dict)
    dm_dict = convert_miles_to_meters(dm_dict)
    dm_dict = add_contact_info(dm_dict)
    dm_dict = format_machine_id(dm_dict)

    with open(out_path, "w") as f:
        json.dump(dm_dict, f)

```

<aside> 💡

il reste plein de petits bugs !

Par exemple, pour éviter d’écraser les contact_informations si elles existent déjà, on avait mis des if/else dans le [main.py](http://main.py):

```python
import json
from drill_utils import (
    convert_miles_to_meters,
    convert_dates,
    add_contact_info,
    format_machine_id,
)

file_to_read = "drilling_machine4.json"
file_to_write = f"updated_{file_to_read}"

with open(file_to_read, "r") as f:
    drilling_machine = json.load(f)

# si les spécifications ont l'air d'être en miles, on les change
# pour drilling_machine4, ce code ne sera pas exécuté
if "miles" in drilling_machine["specifications"].keys():
    drilling_machine = convert_miles_to_meters(drilling_machine)

drilling_machine = convert_dates(drilling_machine)

# si le champ contact_information n'existe pas déjà, on le crée
# pour drilling_machine4, ce code ne sera pas exécuté
if "contact_information" not in drilling_machine.keys():
    drilling_machine = add_contact_info(drilling_machine)

# si le champ machine_id existe, on harmonise son format avec zfill()
# pour drilling_machine4, ce code ne sera pas exécuté
if "machine_id" in drilling_machine.keys():
    drilling_machine = format_machine_id(drilling_machine)

print(drilling_machine)

with open(file_to_write, "w") as f:
    json.dump(drilling_machine, f)

```

Vous pouvez les remettre dans le code définitif.

Mais **le mieux** si vous voulez faire les choses proprement, c’est de mettre cette logique métier dans les différentes fonctions et pas dans le corps du [main.py](http://main.py).

Je vous invite à le faire maintenant.

![MAINTENANT !!!!!!!](https://prod-files-secure.s3.us-west-2.amazonaws.com/ff8c7db2-c3f7-4f1d-85c9-674bddcdcbd3/b8ecc111-f295-4d6b-b247-8c1983399e02/image.png)

MAINTENANT !!!!!!!

Vous avez désormais toutes les connaissances nécessaires pour déplacer du code (on appelle ça factoriser ou refactor en anglais) en vous assurant que l’objectif final est respecté 🙂

</aside>


