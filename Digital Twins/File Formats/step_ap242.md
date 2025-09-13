# STEP AP242

Le **format STEP AP242** (ISO 10303-242) est un fichier texte brut (ASCII) qui suit le standard **STEP (Standard for the Exchange of Product Data)**.

Un **raw file** AP242 ressemble à un fichier `.stp` ou `.step` contenant :

* Un **header** qui décrit le fichier (version STEP, schéma utilisé, application, auteur, date, etc.)
* Un **body** avec des entités numérotées (`#1`, `#2`, etc.), chacune décrivant des objets du modèle (points, surfaces, arêtes, assemblages, PMI, etc.).
* Des références croisées entre entités, formant un graphe de description géométrique et topologique.

Voici un **exemple simplifié** d’un fichier STEP AP242 brut :

```plaintext
ISO-10303-21;
HEADER;
FILE_DESCRIPTION(('STEP AP242 file'),'1');
FILE_NAME('example_part.stp','2025-09-02T20:35:00',('John Doe'),('MyCompany'),'STEP Exporter 3D v1.0','','');
FILE_SCHEMA(('AP242_MANAGED_MODEL_BASED_3D_ENGINEERING_MIM_LF'));
ENDSEC;
DATA;
#1 = CARTESIAN_POINT('Origin',(0.0,0.0,0.0));
#2 = DIRECTION('XAxis',(1.0,0.0,0.0));
#3 = DIRECTION('YAxis',(0.0,1.0,0.0));
#4 = AXIS2_PLACEMENT_3D('Origin Placement',#1,#2,#3);
#5 = PRODUCT_DEFINITION('Part001','Example Part',#10,#11);
#6 = ADVANCED_FACE('FrontFace',(#7),#8,.F.);
#7 = PLANE('',#4);
#8 = CLOSED_SHELL('MainBody',(#6));
#9 = SHAPE_REPRESENTATION('Part Shape',(#8),#12);
ENDSEC;
END-ISO-10303-21;
```

### **Explication des sections**

* **HEADER** : métadonnées sur le fichier.

  * `FILE_DESCRIPTION`, `FILE_NAME`, `FILE_SCHEMA` précisent le contexte et la version AP242.
* **DATA** : entités du modèle décrites ligne par ligne.

  * `CARTESIAN_POINT`, `DIRECTION`, `AXIS2_PLACEMENT_3D` : définissent les coordonnées et axes.
  * `PRODUCT_DEFINITION` : définition de la pièce.
  * `ADVANCED_FACE`, `PLANE`, `CLOSED_SHELL` : géométrie de la pièce.
  * `SHAPE_REPRESENTATION` : associe la forme au produit.

### **Caractéristiques du format AP242**

* **Texte brut lisible** : chaque entité est repérée par `#ID` et référencée par d'autres.
* **ASCII universel** : fonctionne sur tous les systèmes sans encodage spécial.
* **Sémantique riche** : peut inclure :

  * Géométrie (volumique, surfacique)
  * Assemblages et contraintes
  * PMI (Product Manufacturing Information) comme cotes, tolérances
  * Gestion des versions et révisions (managed model).

### **Comparaison rapide**

| Format                | Lecture humaine | Contenu                                      | Usage                |
| --------------------- | --------------- | -------------------------------------------- | -------------------- |
| **STEP AP242**        | Oui             | Géométrie, assemblages, PMI, gestion produit | Échanges industriels |
| **IGES**              | Partiellement   | Géométrie                                    | Ancien, moins riche  |
| **Parasolid (.x\_t)** | Non (binaire)   | Géométrie solide                             | Usage propriétaire   |


---


Un **fichier STEP AP242 contenant des PMI** (*Product & Manufacturing Information*) reste un fichier **texte brut** `.stp` ou `.step`, mais avec des entités supplémentaires qui décrivent :

* Des **annotations 3D** (dimensions, tolérances, symboles, textes techniques)
* Leurs **références aux entités géométriques** (faces, arêtes, volumes)
* Leurs **styles** (couleurs, calques, etc.).

Voici un **exemple simplifié d’un fichier AP242 PMI** :

```plaintext
ISO-10303-21;
HEADER;
FILE_DESCRIPTION(('STEP AP242 PMI example'),'1');
FILE_NAME('bracket_with_PMI.stp','2025-09-02T22:10:00',('John Doe'),('ACME Corp'),'PMI Exporter v2.3','','');
FILE_SCHEMA(('AP242_MANAGED_MODEL_BASED_3D_ENGINEERING_MIM_LF'));
ENDSEC;
DATA;
#1  = CARTESIAN_POINT('Origin',(0.0,0.0,0.0));
#2  = DIRECTION('Z Axis',(0.0,0.0,1.0));
#3  = DIRECTION('X Axis',(1.0,0.0,0.0));
#4  = AXIS2_PLACEMENT_3D('Origin Placement',#1,#2,#3);
#5  = ADVANCED_BREP_SHAPE_REPRESENTATION('Bracket Geometry',(#10,#11),#20);
#6  = PRODUCT('BRACKET-123','Example Bracket', 'Mechanical Part');
#7  = PRODUCT_DEFINITION('Design version','',#6,#21);
#8  = SHAPE_REPRESENTATION_RELATIONSHIP('','',#5,#7);

-- PMI ANNOTATIONS --
#100 = CARTESIAN_POINT('PMI Note Position',(10.0,5.0,0.0));
#101 = PRESENTATION_STYLE_ASSIGNMENT((#105));
#102 = TEXT_LITERAL_WITH_EXTENT('Hole Ø10 ±0.1', '', '', '', #100, 5.0, 2.0);
#103 = GEOMETRIC_ITEM_SPECIFIC_USAGE(#102,#110); 
#104 = STYLED_ITEM('PMI Note Style',(#101),#102);
#105 = PRESENTATION_STYLE_BY_CONTEXT('Arial', 'black');

-- PMI LINK TO GEOMETRY --
#110 = EDGE_CURVE('Hole Edge', #200, #201, #202, .T.);

-- COLOUR / STYLE FOR PMI --
#120 = COLOUR_RGB('Red',1.0,0.0,0.0);
#121 = STYLED_ITEM('Dimension Color',(#120),#102);

ENDSEC;
END-ISO-10303-21;
```

### **Décryptage des blocs**

| Bloc            | Description                                                                                                                 |
| --------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `#1` → `#8`     | **Géométrie du modèle** : points, directions, repères, surfaces, topologie.                                                 |
| `#100` → `#105` | **PMI textuelle** : la note *"Hole Ø10 ±0.1"* placée à des coordonnées spécifiques dans l’espace, avec son style et police. |
| `#103`          | Lien entre la **note PMI** et l’élément géométrique cible (ici, `#110` = l’arête du trou).                                  |
| `#120` → `#121` | **Couleurs** ou styles associés à l’annotation PMI.                                                                         |

---

### **Caractéristiques d’un fichier PMI AP242**

* **Toujours en ASCII** : facile à lire et à parser.
* Contient des **références croisées** : les annotations pointent toujours vers des entités de géométrie.
* Compatible avec les outils CAD comme **CATIA, NX, Creo, SolidWorks** pour échanges de modèles 3D enrichis.
* Peut inclure :

  * Tolérances dimensionnelles (GD\&T)
  * Notes textuelles
  * Symboles de rugosité, matériaux
  * Tableaux de perçage ou listes d’éléments.


---

### **Exemple : `part_with_hole_ap242.stp`**

Voici un **exemple détaillé et réaliste** d’un **fichier STEP AP242 brut** (ASCII) pour une pièce mécanique simple.
Cet exemple montre une géométrie 3D (un bloc avec un trou cylindrique) et quelques métadonnées typiques d’**AP242 Managed Model Based 3D Engineering**.

```plaintext
ISO-10303-21;
HEADER;
FILE_DESCRIPTION(('AP242 Managed Model'),'2;1');
FILE_NAME('part_with_hole.stp','2025-09-02T18:47:00',
    ('John Doe'),
    ('ACME Corp.'),
    'CADSystem Pro v12.1',
    'Generated by CADSystem Pro',
    'AP242 export with PMI');
FILE_SCHEMA(('AP242_MANAGED_MODEL_BASED_3D_ENGINEERING_MIM_LF'));
ENDSEC;
DATA;
#10 = PRODUCT('Part123','Mounting Bracket','A simple bracket with one cylindrical hole',(#20));
#11 = PRODUCT_CONTEXT('3D Mechanical Design',#30,'mechanical');
#12 = PRODUCT_DEFINITION_FORMATION('1.0','Released',#10);
#13 = PRODUCT_DEFINITION('Part123 Instance','Single part instance',#12,#11);

#20 = PRODUCT_CATEGORY('mechanical_part','Mechanical Part');
#21 = PRODUCT_CATEGORY_RELATIONSHIP('categorization',#20,#10);

#30 = APPLICATION_CONTEXT('design');

#40 = SHAPE_DEFINITION_REPRESENTATION(#13,#50);
#50 = ADVANCED_BREP_SHAPE_REPRESENTATION('Mounting Bracket',(#100,#200,#300),#60);
#60 = GEOMETRIC_REPRESENTATION_CONTEXT(3) GLOBAL_UNCERTAINTY_ASSIGNED_CONTEXT((#61)) GLOBAL_UNIT_ASSIGNED_CONTEXT((#62,#63,#64)) REPRESENTATION_CONTEXT('3D','model space');
#61 = UNCERTAINTY_MEASURE_WITH_UNIT(LENGTH_MEASURE(1.0E-6),#62,'accuracy');
#62 = (LENGTH_UNIT() NAMED_UNIT(*) SI_UNIT(.MILLI.,.METRE.));
#63 = (PLANE_ANGLE_UNIT() NAMED_UNIT(*) SI_UNIT($,.RADIAN.));
#64 = (SOLID_ANGLE_UNIT() NAMED_UNIT(*) SI_UNIT($,.STERADIAN.));

#100 = MANIFOLD_SOLID_BREP('Block Body',#101);
#101 = CLOSED_SHELL('MainSolid',(#110,#120,#130,#140,#150,#160));

#110 = ADVANCED_FACE('Top Face',(#111),#170,.T.);
#111 = PLANE('',#180);

#120 = ADVANCED_FACE('Bottom Face',(#121),#170,.F.);
#121 = PLANE('',#181);

#130 = ADVANCED_FACE('Front Face',(#131),#170,.T.);
#131 = PLANE('',#182);

#140 = ADVANCED_FACE('Back Face',(#141),#170,.F.);
#141 = PLANE('',#183);

#150 = ADVANCED_FACE('Left Face',(#151),#170,.T.);
#151 = PLANE('',#184);

#160 = ADVANCED_FACE('Right Face',(#161),#170,.F.);
#161 = PLANE('',#185);

#170 = PLANE('Reference Plane',#180);

#180 = AXIS2_PLACEMENT_3D('Origin',#190,#191,#192);
#181 = AXIS2_PLACEMENT_3D('Z-Down',#190,#191,#193);
#182 = AXIS2_PLACEMENT_3D('Y-Front',#190,#192,#191);
#183 = AXIS2_PLACEMENT_3D('Y-Back',#190,#194,#191);
#184 = AXIS2_PLACEMENT_3D('X-Left',#190,#193,#192);
#185 = AXIS2_PLACEMENT_3D('X-Right',#190,#191,#194);

#190 = CARTESIAN_POINT('Origin',(0.0,0.0,0.0));
#191 = DIRECTION('X Axis',(1.0,0.0,0.0));
#192 = DIRECTION('Y Axis',(0.0,1.0,0.0));
#193 = DIRECTION('Z Axis',(0.0,0.0,1.0));
#194 = DIRECTION('Reverse Y Axis',(0.0,-1.0,0.0));

#200 = CYLINDRICAL_SURFACE('Hole Cylinder',#201,5.0);
#201 = AXIS2_PLACEMENT_3D('Hole Axis',#202,#193,#191);
#202 = CARTESIAN_POINT('Hole Center',(50.0,25.0,0.0));

#300 = MANIFOLD_SOLID_BREP('Hole Volume',#301);
#301 = CLOSED_SHELL('Hole Geometry',(#310));
#310 = ADVANCED_FACE('Hole Side Face',(#311),#200,.T.);
#311 = CYLINDRICAL_SURFACE('Cylindrical Wall',#201,5.0);

#400 = SHAPE_REPRESENTATION_RELATIONSHIP('Shape with PMI',#50,#500);
#500 = DRAUGHTING_MODEL('PMI Model',(#510),#60);
#510 = PRESENTATION_LAYER_ASSIGNMENT('Annotations',(#520),'layer');
#520 = PRESENTATION_STYLE_ASSIGNMENT((#530));
#530 = PRESENTATION_STYLE_BY_CONTEXT('Default Style',#540);
#540 = COLOUR_RGB('Annotation Color',0.0,0.0,1.0);

ENDSEC;
END-ISO-10303-21;
```

---

### **Ce que montre cet exemple**

| Section                            | Description                                                                  |
| ---------------------------------- | ---------------------------------------------------------------------------- |
| **HEADER**                         | Métadonnées sur le fichier, auteur, version AP242.                           |
| **PRODUCT & CONTEXT**              | Définitions du produit, de sa version, et de son contexte d’ingénierie.      |
| **BREP (Boundary Representation)** | Définit la géométrie du bloc principal (#100) et le trou cylindrique (#200). |
| **AXIS2\_PLACEMENT\_3D**           | Définit des systèmes de coordonnées locaux pour faces et axes.               |
| **PMI**                            | Inclusion d’une annotation 3D (#500 → #530) avec un style graphique bleu.    |

---

### **Caractéristiques importantes**

* **Lisible à l’œil** : bien que complexe, chaque ligne décrit une entité précise.
* **Références croisées** : chaque `#ID` est lié à d’autres entités, formant un graphe de données.
* **Précision** : unités, tolérances et axes sont explicitement définis.
* **Support avancé** : PMI, couleurs, couches, et gestion des versions sont intégrées dans AP242, contrairement aux versions plus anciennes comme AP203 ou AP214.

