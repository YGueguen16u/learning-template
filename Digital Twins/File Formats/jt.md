Le **format JT** (**Jupiter Tessellation**, maintenant norme ISO 14306\*\*) n’est **pas en texte brut** comme le STEP AP242.
C’est un **format binaire compressé**, conçu par Siemens PLM, optimisé pour :

* **La visualisation rapide** (maillage léger, LOD – Levels of Detail)
* **La CAO** (inclusion optionnelle des BREP, PMI, métadonnées)
* **L’échange industriel** dans des PLM et viewers comme **Teamcenter, NX, Solid Edge, Creo, Catia**.

---

### **Structure d’un fichier JT**

Un fichier `.jt` est composé de blocs binaires, généralement organisés comme suit :

| Bloc                       | Description                                           |
| -------------------------- | ----------------------------------------------------- |
| **Header**                 | Version JT, type de compression, métadonnées globales |
| **Segment Table**          | Liste des segments (géométrie, attributs, PMI)        |
| **LOD Geometry**           | Mesh triangulé (tessellation) pour visualisation      |
| **BREP Geometry**          | (Optionnel) NURBS / courbes CAO pour précision        |
| **PMI**                    | Dimensions, tolérances, annotations 3D                |
| **Attributes**             | Matériaux, couleurs, noms de pièces                   |
| **Instances / Assemblies** | Hiérarchie des composants d’assemblage                |

---

### **Exemple de contenu brut**

Si tu ouvres un `.jt` dans un éditeur hexadécimal, tu verras **des signatures binaires**, par exemple :

```
00000000  4a 54 20 46 69 6c 65 20  46 6f 72 6d 61 74 0a 56  |JT File Format.V|
00000010  65 72 73 69 6f 6e 20 31  30 2e 35 0a 42 69 67 45  |ersion 10.5.BigE|
00000020  6e 64 69 61 6e 0a 00 00  00 00 00 00 00 00 00 00  |ndian..........|
00000030  10 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
```

Ici :

* `JT File Format` → signature texte.
* `Version 10.5` → version du standard.
* `BigEndian` → encodage binaire.

Ensuite, tu verras des blocs **compressés en zlib ou LZMA**, donc non lisibles sans librairie dédiée.

---

### **Exemple simplifié de contenu décodé**

Après parsing avec une bibliothèque comme **JT Open Toolkit** ou **Open Cascade**, tu obtiens une structure logique comme :

```json
{
  "version": "10.5",
  "units": "millimeters",
  "assemblies": [
    {
      "name": "Example_Assembly",
      "components": [
        {
          "id": "Part_001",
          "geometry": {
            "type": "BREP",
            "faces": 256,
            "edges": 512
          },
          "mesh": {
            "triangles": 45231,
            "normals": true
          }
        }
      ]
    }
  ],
  "PMI": [
    {
      "type": "dimension",
      "value": "Ø50 ±0.1",
      "attached_to": "Part_001"
    }
  ]
}
```

---

### **Différences avec STEP AP242**

| Critère         | **STEP AP242**                                | **JT**                                         |
| --------------- | --------------------------------------------- | ---------------------------------------------- |
| Format          | **Texte brut (ASCII)**                        | **Binaire compressé**                          |
| Lecture humaine | Oui                                           | Non (nécessite un parser)                      |
| Données CAO     | Géométrie exacte (BREP), PMI, gestion produit | Tessellation (LOD), optionnel BREP, PMI        |
| Usage principal | Échanges CAO/PLM normalisés                   | Visualisation rapide, Digital Twin, allégement |
| Norme ISO       | ISO 10303-242                                 | ISO 14306                                      |

---

### Exemple de fichier JT brut

#### **1. Signature et en-tête binaire**

Chaque fichier commence par un **header texte lisible**, suivi de blocs binaires.
Voici un **exemple d’entête** dans un éditeur hexadécimal :

```
00000000  4A 54 20 46 69 6C 65 20  46 6F 72 6D 61 74 0A 56   JT File Format.V
00000010  65 72 73 69 6F 6E 20 31  30 2E 35 0A 4C 69 74 74   ersion 10.5.Litt
00000020  6C 65 45 6E 64 69 61 6E  0A 00 00 00 00 00 00 00   leEndian........
```

**Lecture de l’en-tête :**

* **"JT File Format"** → signature.
* **"Version 10.5"** → version du standard.
* **"LittleEndian"** → encodage binaire.
* **Blocs réservés** pour les offsets des sections suivantes.

---

#### **2. Structure logique interne**

Après l’en-tête, le fichier contient différents segments compressés, organisés par type :

| **Bloc**                | **Description**                                                   |
| ----------------------- | ----------------------------------------------------------------- |
| **File Header Segment** | Métadonnées globales : version, unités, infos d’export            |
| **Segment Table**       | Table des offsets vers chaque bloc                                |
| **LOD Geometry**        | Maillages triangulés (pour la visualisation rapide)               |
| **BREP Geometry**       | Géométrie exacte NURBS (si exportée)                              |
| **PMI**                 | Informations de fabrication (dimensions, tolérances, annotations) |
| **Assembly Hierarchy**  | Hiérarchie des pièces et sous-assemblages                         |
| **Attributes**          | Matériaux, couleurs, transparence                                 |

---

#### **3. Exemple détaillé de contenu logique**

Voici un **exemple reconstitué** de ce que contient un fichier `.jt` pour une pièce simple, **après parsing** avec une librairie Siemens ou Open Cascade :

```json
{
  "version": "10.5",
  "units": "millimeters",
  "model_info": {
    "author": "John Doe",
    "company": "MyCompany",
    "export_tool": "NX 2212 JT Exporter",
    "creation_date": "2025-09-02T20:35:00Z"
  },
  "assemblies": [
    {
      "id": "A1",
      "name": "Gearbox Assembly",
      "children": [
        {
          "id": "P1",
          "name": "Gear_01",
          "geometry": {
            "brep": {
              "faces": 142,
              "edges": 320,
              "volumes": 1
            },
            "mesh": {
              "triangles": 58240,
              "vertices": 29120,
              "normals": true,
              "lod": [500, 5000, 50000]
            }
          },
          "material": {
            "name": "Steel",
            "color": [0.7, 0.7, 0.7],
            "transparency": 0.0
          },
          "pmi": [
            {
              "type": "dimension",
              "text": "Ø50 ±0.1",
              "attached_to": "hole_face_12"
            },
            {
              "type": "note",
              "text": "Machine finish required"
            }
          ]
        },
        {
          "id": "P2",
          "name": "Housing",
          "geometry": {
            "mesh": {
              "triangles": 120000,
              "vertices": 60000,
              "normals": true
            }
          },
          "material": {
            "name": "Aluminum",
            "color": [0.8, 0.8, 0.9],
            "transparency": 0.1
          }
        }
      ]
    }
  ]
}
```

---

#### **4. Points clés à retenir**

* **Compression** : les données géométriques sont compressées avec `zlib` ou `LZMA`.
* **LOD multiples** : pour un même objet, plusieurs niveaux de maillage sont stockés.
* **Assemblages** : le fichier contient un graphe hiérarchique avec des instances de pièces réutilisées.
* **BREP optionnel** : si le fichier ne contient que la tessellation, il ne peut pas être réimporté en CAO de précision.
* **PMI riche** : annotations 3D pour la fabrication, lisibles dans des viewers industriels.

---

#### **5. Différences avec un STEP AP242**

| **Aspect**            | **STEP AP242**     | **JT**                           |
| --------------------- | ------------------ | -------------------------------- |
| **Lisibilité**        | Texte brut ASCII   | Binaire compressé                |
| **Géométrie**         | BREP exacte        | Tessellation + (optionnel) BREP  |
| **Assemblages**       | Oui                | Oui                              |
| **PMI (annotations)** | Oui                | Oui                              |
| **Usage principal**   | Échange neutre CAO | Visualisation, PLM, Digital Twin |
| **Taille**            | Plus volumineux    | Plus compact                     |

---
