
```json
{
    "site_id": "FR-NPP-01",
    "name": "Centrale de Valmont",
    "country": "France",
    "website_url": "https://www.valmont.fr",
    "reactors": [
        {
            "reactor_id": "VAL-1",
            "reactor_type": "PWR",
            "commissioning_date": "2010-05-12",
            "status": "Online",
            "thermal_power_MWt": 3200,
            "electric_power_MWe": 1050,
            "design_pressure_bar": 155,
            "primary_coolant": "H2O (light water)",
            "safety_class": "IEC61508",
            "safety_integrity_level": "SIL-3",
            "fuels": [
                { 
                    "type": "UO2", 
                    "enrichment_%": 4.5 
                },
                { 
                    "type": "MOX", 
                    "plutonium_%": 7 
                }
            ],
            "safety_systems": [
                [
                    "Emergency Core Cooling System",
                    "Reactor Protection System"
                ],
                [
                    "Containment Spray System",
                    "Passive Heat Removal System"
                ],
                [
                    "Diesel Generators",
                    "Emergency Batteries"
                ]
            ],
            "probabilistic_safety": {
                "core_damage_frequency_per_reactor_year": 1.5e-5,
                "large_early_release_frequency_per_reactor_year": 2.0e-6
            },
            "events": [
                [
                    { 
                        "date": "2022-07-15", 
                        "description": "Inspection périodique", 
                        "level_INES": 0 
                    }
                ],
                [
                    { 
                        "date": "2023-02-10", 
                        "description": "Test de sûreté circuit primaire", 
                        "level_INES": 1 
                    }
                ]
            ],
            "maintenance_calendar": [
                [
                    { 
                        "day": "2023-06-01", 
                        "task": "Inspection visuelle" 
                    },
                    { 
                        "day": "2023-06-02", 
                        "task": "Vérification capteurs" 
                    }
                ],
                [
                    { 
                        "day": "2023-06-08", 
                        "task": "Test soupapes de sûreté" 
                    },
                    { 
                        "day": "2023-06-09", 
                        "task": "Contrôle électrique" 
                    }
                ]
            ]
        },
        {
            "reactor_id": "VAL-2",
            "reactor_type": "PWR",
            "commissioning_date": "2013/11/03",
            "status": "Outage",
            "thermal_power_MWt": 3200,
            "electric_power_MWe": 1050,
            "design_pressure_bar": 155,
            "primary_coolant": "H2O (light water)",
            "safety_class": "IEC61508",
            "safety_integrity_level": "SIL-3",
            "fuels": [
                [
                    { 
                        "type": "UO2", 
                        "enrichment_%": 4.2 
                    }
                ],
                [
                    { 
                        "type": "UO2", 
                        "enrichment_%": 4.4 
                    }
                ]
            ],
            "safety_systems": [
                [
                    "Emergency Core Cooling System",
                    "Reactor Protection System"
                ],
                [
                    "Containment Spray System"
                ],
                [
                    "Diesel Generators",
                    "Station Blackout Mobile DG"
                ]
            ],
            "events": [
                [
                    { 
                        "date": "2023-11-20", 
                        "description": "Début arrêt programmé", 
                        "level_INES": 0 
                    }
                ],
                [
                    { 
                        "date": "2024-01-12", 
                        "description": "Remplacement d'assemblages combustibles", 
                        "level_INES": 0 
                    }
                ]
            ],
            "maintenance_calendar": [
                [
                    { 
                        "day": "2024-01-15", 
                        "task": "Ouverture cuve" 
                    },
                    { 
                        "day": "2024-01-16", 
                        "task": "Déchargement combustible" 
                    }
                ],
                [
                    { 
                        "day": "2024-01-22", 
                        "task": "Rechargement combustible" 
                    },
                    { 
                        "day": "2024-01-23", 
                        "task": "Essais à froid" 
                    }
                ]
            ]
        }
    ],
    "geo": { 
        "lat": 47.927, 
        "lon": 1.905, 
        "elevation_m": 112 
    }
},
{
    "site_id": "SE-RR-02",
    "name": "Skog Research Reactor",
    "country": "Sweden",
    "website_url": "https://www.skogresearchreactor.se",
    "reactors": [
        {
            "reactor_id": "SKG-R1",
            "reactor_type": "RR (pool-type)",
            "commissioning_date": "15-09-2002",
            "status": "Online",
            "thermal_power_MWt": 0.5,
            "electric_power_MWe": 0,
            "design_pressure_bar": 1,
            "primary_coolant": "H2O (demineralized)",
            "safety_integrity_level": "SIL-2",
            "fuels": [
                [
                    { 
                        "type": "U3Si2-Al", 
                        "enrichment_%": 19.75 
                    }
                ],
                [
                    { 
                        "type": "UMo-Al", 
                        "enrichment_%": 19.75 
                    }
                ]
            ],
            "safety_systems": [
                [
                    "Reactor Trip System"
                ],
                [
                    "Pool Cooling System",
                    "Passive Heat Removal Loop"
                ],
                [
                    "Radiation Monitoring",
                    "Emergency Ventilation"
                ]
            ],
            "events": [
                [
                    { 
                        "date": "2021-05-04", 
                        "description": "Calibration instruments", 
                        "level_INES": 0 
                    }
                ],
                [
                    { 
                        "date": "2023-10-12", 
                        "description": "Essai d’irradiation échantillons", 
                        "level_INES": 0 
                    }
                ]
            ],
            "maintenance_calendar": [
                [
                    { 
                        "day": "2023-03-07", 
                        "task": "Nettoyage piscine" 
                    }
                ],
                [
                    { 
                        "day": "2023-03-14", 
                        "task": "Vérification grappes" 
                    }
                ]
            ]
        }
    ],
    "geo": { 
        "lat": 59.3326, 
        "lon": 18.0649, 
        "elevation_m": 18 
    }
},
{
    "site_id": "RU-NPP-07",
    "name": "Akademik Lomonosov (Floating NPP)",
    "country": "Russia",
    "reactors": [
        {
            "reactor_id": "KLT-40S-1",
            "reactor_type": "KLT-40S (marine PWR)",
            "commissioning_date": "2020-05-22",
            "status": "Online",
            "thermal_power_MWt": 150,
            "electric_power_MWe": 35,
            "design_pressure_bar": 120,
            "primary_coolant": "H2O (light water)",
            "safety_integrity_level": "SIL-3",
            "fuels": [
                { 
                    "type": "UO2", 
                    "enrichment_%": 14 
                }
            ],
            "safety_systems": [
                "Emergency Core Cooling",
                "Radiation Monitoring",
                "Diesel Generators",
                "Marine Containment Barriers"
            ],
            "events": [
                { 
                    "date": "2021-11-30", 
                    "description": "Inspection portuaire annuelle", 
                    "level_INES": 0 
                }
            ]
        },
        {
            "reactor_id": "KLT-40S-2",
            "reactor_type": "KLT-40S (marine PWR)",
            "commissioning_date": "2020-05-22",
            "status": "Online",
            "thermal_power_MWt": 150,
            "electric_power_MWe": 35,
            "design_pressure_bar": 120,
            "primary_coolant": "H2O (light water)",
            "safety_integrity_level": "SIL-3",
            "fuels": [
                { 
                    "type": "UO2", 
                    "enrichment_%": 14 
                }
            ],
            "safety_systems": [
                "Emergency Core Cooling",
                "Radiation Monitoring",
                "Diesel Generators",
                "Marine Containment Barriers"
            ],
            "events": [
                { 
                    "date": "2022-04-17", 
                    "description": "Essai d’alimentation en électricité locale", 
                    "level_INES": 0 
                }
            ]
        }
    ],
    "geo": { 
        "lat": 69.7, 
        "lon": 170.313, 
        "elevation_m": 5 
    }
}
``` 

1. display the two last characters of the string "FR-NPP-01" and the last character of "VAL-1"

```python
site_id = "FR-NPP-01"
print(site_id[-2:])

reactor_id = "VAL-1"
print(reactor_id[-1:])
```

2. display all the characters of the string "Skog Research Reactor" from the  before the last one to the second one with a stride of 2

```python
reactor_name = "Skog Research Reactor"
print(reactor_name[-2:1:-2])
```


3. Verify the length of the string "FR-NPP-01" is less than 50 characters and print `length of the field {name_of_the_field} is Ok` if it is

```python
site_id = "FR-NPP-01"
print("length of the field site_id is OK" if (len(site_id) < 50) else f"length of the field site_id is NOT OK and is : {len(site_id)}")
```

4. Display the following path of "C:\\sys\\clear-river\\crs-1\\admin"

- using raw string

```python
print(r"C:\\sys\\clear-river\\crs-1\\admin")
```

5. Capitalize all word of "skog research reactor"

```python
word_1, word_2, word_3 = "skog research reactor".split()

# Method 1
reactor_name = word_1.capitalize() + " " + word_2.capitalize() + " " + word_3.capitalize()
print(reactor_name)

# Method 2
reactor_name = " ".join([word_1.capitalize(), word_2.capitalize(), word_3.capitalize()])
print(reactor_name)

# Method 3
reactor_name = " ".join(map(str.capitalize, "skog research reactor".split()))
print(reactor_name)
```

6. For Centrale de Valmont, print its name, country and all reactor_ids with % operator.

```python
print("%s is in %s and has the following reactors %s" %("Centrale de Valmont", "France", "VAL-1"))
```

7. For the reactor 1 of the site FR-NPP-01, print its reactor_id, reactor_type, commissioning_date, status, thermal_power_MWt, electric_power_MWe, design_pressure_bar, primary_coolant, safety_class, safety_integrity_level, probabilistic_safety, path_from_root with f string.

```python
reactor_id = "VAL-1"
reactor_type = "PWR"
commissioning_date = "2010-05-12"
status = "Online"
thermal_power_MWt = 3200
electric_power_MWe = 1050
design_pressure_bar = 155
primary_coolant = "H2O (light water)"
safety_class = "IEC61508"
safety_integrity_level = "SIL-3"
probabilistic_safety = {"core_damage_frequency_per_reactor_year": 1.5e-5, "large_early_release_frequency_per_reactor_year": 2.0e-6}
path_from_root = "C:\\sys\\valmont\\val-1\\admin"   
print(f"reactor_id: {reactor_id}\nreactor_type: {reactor_type}\ncommissioning_date: {commissioning_date}\nstatus: {status}\nthermal_power_MWt: {thermal_power_MWt}\nelectric_power_MWe: {electric_power_MWe}\ndesign_pressure_bar: {design_pressure_bar}\nprimary_coolant: {primary_coolant}\nsafety_class: {safety_class}\nsafety_integrity_level: {safety_integrity_level}\nprobabilistic_safety: {probabilistic_safety}\npath_from_root: {path_from_root}")
```

8. Write in uppercase the reactor_id of val-1 after checking if it is lowercase.

```python
reactor_id = "val-1"
if reactor_id.islower():
    reactor_id = reactor_id.upper()
print(reactor_id)
```

9. Verify if the status of val-1 is uppercase. If it is not, write it in lowercase then capitalize it.

```python
status = "Online"
if not status.isupper():
    status = status.lower().capitalize()
else:
    status = status.lower()
print(status)
```


10. Replace the year of commissioning_date of val-1 by 2011 if the year is 2010.

```python
commissioning_date = "2010-05-12"
year = commissioning_date.split("-")[0]
if year == "2010":
    commissioning_date = commissioning_date.replace(year, "2011")
print(commissioning_date)
```

11. Find the index of the numeric digit in the string "val-1" with regex.

```python
import re

reactor_id = "val-1"
index = re.search(r'\d', reactor_id).start()
print(index)
```

12. Count the number of `r` in "skog research reactor" between the second and eleventh character.

```python
reactor_name = "skog research reactor"
nb_r = reactor_name.count("r", 1, 12)
print(nb_r)
```

13. Add Two zeros before de `1`of "val-1" in one line.

```python
reactor_id = "val-1"
print(reactor_id.replace(reactor_id.split("-")[1], reactor_id.split("-")[1].zfill(3))) # one line
```

14. Replace all dates by the ISO 8601 format (YYYY-MM-DD) in one line for each.

```python
commissioning_date = "2013/11/03"
print("-".join(commissioning_date.split("/")))

commissioning_date_2 = "15-09-2002"
print("-".join([commissioning_date_2.split("-")[2], commissioning_date_2.split("-")[1], commissioning_date_2.split("-")[0]]))

# or reverse

print("-".join(commissioning_date_2.split("-")[::-1]))
```

15. In the list of safety_systems, add "Containment Spray System" with "Passive Heat Removal System", "Diesel Generators" with "Emergency Batteries". 

```python
safety_systems = [["Emergency Core Cooling System", "Reactor Protection System"]]

safety_systems.append(["Containment Spray System", "Passive Heat Removal System"])
safety_systems.append(["Diesel Generators", "Emergency Batteries"])
print(safety_systems)
```

16. Add to maintenance_calendar the following tasks:                   
    
```python
{     "day": "2023-06-08", 
        "task": "Test soupapes de sûreté" 
    },
{ 
        "day": "2023-06-09", 
        "task": "Contrôle électrique" 
    }
```

```python
maintenance_calendar = [
    [
        { 
            "day": "2023-06-01", 
            "task": "Inspection visuelle" 
        },
        { 
            "day": "2023-06-02", 
            "task": "Vérification capteurs" 
        }
    ]
]
maintenance_calendar.extend([
    [
        { 
            "day": "2023-06-08", 
            "task": "Test soupapes de sûreté" 
        },
        { 
            "day": "2023-06-09", 
            "task": "Contrôle électrique" 
        }
    ]
])

17. 



