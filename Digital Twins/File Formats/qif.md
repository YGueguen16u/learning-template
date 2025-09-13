# QIF

Le format **QIF** (**Quality Information Framework**, ISO 23952\*\*) est **un format XML lisible en texte brut**, standardisé pour l’**interopérabilité des données métrologiques et qualité** dans l’industrie.
Il est très utilisé dans le cadre de la **métrologie 3D**, du **contrôle dimensionnel** et de l’**interopérabilité entre logiciels de CAO, inspection et métrologie**.

---

### **Structure générale d’un fichier QIF**

Un fichier `.qif` est un document **XML** comprenant :

* Une **entête** qui décrit le schéma utilisé et la version du standard.
* Des **sections principales** qui peuvent inclure :

  * **Header** : métadonnées (version, auteur, date, etc.)
  * **Product Definition** : description de la pièce
  * **Measurement Resources** : informations sur les instruments de mesure
  * **Plans** : séquences de mesures prévues
  * **Results** : résultats des inspections (mesures réelles, déviations)
  * **Statistics** : informations sur les analyses statistiques
  * **Extensions** : données personnalisées.

---

### **Exemple brut d’un fichier QIF**

Voici un exemple **simplifié** :

```xml
<?xml version="1.0" encoding="UTF-8"?>
<QIFDocument xmlns="http://qifstandards.org/xsd/qif3" QIFVersion="3.0">
  <Header>
    <Application>QIF Generator 2025</Application>
    <Author>John Doe</Author>
    <DateTime>2025-09-02T20:40:00</DateTime>
    <Organization>MyCompany</Organization>
  </Header>

  <Product>
    <PartNumber>Part_001</PartNumber>
    <Name>Example Bracket</Name>
    <Description>Support bracket for test assembly</Description>
  </Product>

  <MeasurementResources>
    <MeasuringDevice>
      <Name>CMM Zeiss Accura</Name>
      <SerialNumber>123456789</SerialNumber>
      <CalibrationDate>2025-05-01</CalibrationDate>
    </MeasuringDevice>
  </MeasurementResources>

  <MeasurementResults>
    <MeasuredFeature>
      <FeatureID>FTR_12</FeatureID>
      <NominalValue>50.0</NominalValue>
      <MeasuredValue>50.02</MeasuredValue>
      <Deviation>+0.02</Deviation>
    </MeasuredFeature>
    <MeasuredFeature>
      <FeatureID>FTR_13</FeatureID>
      <NominalValue>25.0</NominalValue>
      <MeasuredValue>24.99</MeasuredValue>
      <Deviation>-0.01</Deviation>
    </MeasuredFeature>
  </MeasurementResults>
</QIFDocument>
```

---

### **Points clés**

* **Lisible par l’humain** : c’est du XML pur.
* **Facile à parser** avec des bibliothèques comme `xml.etree.ElementTree` ou `lxml` en Python.
* **Extensible** : on peut ajouter des balises personnalisées sans casser le standard.
* **Interopérable** : reconnu par les principaux outils CAO/PLM et métrologie (Zeiss Calypso, PC-DMIS, etc.).

---

### **Comparaison rapide avec STEP AP242 et JT**

| Format         | Type    | Lisible | Données incluses                       | Cas d’usage                     |
| -------------- | ------- | ------- | -------------------------------------- | ------------------------------- |
| **STEP AP242** | ASCII   | Oui     | Géométrie 3D exacte, PMI, assemblages  | Échanges CAO/PLM                |
| **JT**         | Binaire | Non     | Géométrie tessellée, PMI, parfois BREP | Visualisation, Digital Twin     |
| **QIF**        | XML     | Oui     | Mesures, plans de contrôle, résultats  | Métrologie, qualité, inspection |


---

### **Exemple : `bracket_inspection.qif`**


Voici un **exemple complet et détaillé** d’un fichier **QIF 3.0**.
Il couvre **toutes les sections importantes** : métadonnées, définition produit, ressources de mesure, plans de mesure, résultats, statistiques, et extensions.


```xml
<?xml version="1.0" encoding="UTF-8"?>
<QIFDocument xmlns="http://qifstandards.org/xsd/qif3" QIFVersion="3.0">

  <!-- ===========================
       1. HEADER - METADATA
       =========================== -->
  <Header>
    <Application>QIF Exporter 2025</Application>
    <Author>Jane Smith</Author>
    <DateTime>2025-09-02T21:00:00</DateTime>
    <Organization>Acme Industries</Organization>
    <Version>1.0</Version>
    <Description>Quality inspection report for Bracket_1234.</Description>
  </Header>

  <!-- ===========================
       2. PRODUCT DEFINITION
       =========================== -->
  <Product>
    <PartNumber>Bracket_1234</PartNumber>
    <Name>Mounting Bracket</Name>
    <Description>Support bracket for electric motor assembly.</Description>
    <CADModel>
      <FileName>Bracket_1234_AP242.stp</FileName>
      <FileFormat>STEP AP242</FileFormat>
      <Revision>A</Revision>
    </CADModel>
  </Product>

  <!-- ===========================
       3. MEASUREMENT RESOURCES
       =========================== -->
  <MeasurementResources>
    <MeasuringDevice>
      <Name>CMM Zeiss Accura</Name>
      <SerialNumber>ACM-45678</SerialNumber>
      <Type>Coordinate Measuring Machine</Type>
      <SoftwareVersion>Calypso 2025.1</SoftwareVersion>
      <CalibrationDate>2025-08-15</CalibrationDate>
    </MeasuringDevice>
    <Operator>
      <Name>John Doe</Name>
      <ID>EMP-1025</ID>
    </Operator>
  </MeasurementResources>

  <!-- ===========================
       4. PLANNED MEASUREMENTS
       =========================== -->
  <Plans>
    <Plan>
      <PlanID>Plan_001</PlanID>
      <Description>Inspection of critical features for assembly fit.</Description>
      <Features>
        <Feature>
          <FeatureID>FTR_001</FeatureID>
          <Name>Hole Diameter</Name>
          <NominalValue>12.00</NominalValue>
          <Tolerance>±0.05</Tolerance>
          <Unit>mm</Unit>
        </Feature>
        <Feature>
          <FeatureID>FTR_002</FeatureID>
          <Name>Bracket Length</Name>
          <NominalValue>150.00</NominalValue>
          <Tolerance>±0.10</Tolerance>
          <Unit>mm</Unit>
        </Feature>
      </Features>
    </Plan>
  </Plans>

  <!-- ===========================
       5. MEASUREMENT RESULTS
       =========================== -->
  <MeasurementResults>
    <MeasuredFeature>
      <FeatureID>FTR_001</FeatureID>
      <NominalValue>12.00</NominalValue>
      <MeasuredValue>12.03</MeasuredValue>
      <Deviation>+0.03</Deviation>
      <Status>PASS</Status>
      <Unit>mm</Unit>
    </MeasuredFeature>
    <MeasuredFeature>
      <FeatureID>FTR_002</FeatureID>
      <NominalValue>150.00</NominalValue>
      <MeasuredValue>149.92</MeasuredValue>
      <Deviation>-0.08</Deviation>
      <Status>FAIL</Status>
      <Unit>mm</Unit>
      <Notes>Length slightly below lower tolerance limit.</Notes>
    </MeasuredFeature>
  </MeasurementResults>

  <!-- ===========================
       6. STATISTICS
       =========================== -->
  <Statistics>
    <Summary>
      <TotalFeatures>2</TotalFeatures>
      <PassCount>1</PassCount>
      <FailCount>1</FailCount>
      <FirstPassYield>50%</FirstPassYield>
    </Summary>
    <FeatureStatistics>
      <Feature>
        <FeatureID>FTR_001</FeatureID>
        <Mean>12.01</Mean>
        <StdDev>0.02</StdDev>
        <Cp>1.67</Cp>
        <Cpk>1.50</Cpk>
      </Feature>
      <Feature>
        <FeatureID>FTR_002</FeatureID>
        <Mean>149.90</Mean>
        <StdDev>0.05</StdDev>
        <Cp>1.00</Cp>
        <Cpk>0.85</Cpk>
      </Feature>
    </FeatureStatistics>
  </Statistics>

  <!-- ===========================
       7. EXTENSIONS / CUSTOM DATA
       =========================== -->
  <Extensions>
    <Note>Operator recommends rechecking machine calibration for axis Y.</Note>
    <CustomTag key="ProductionBatch">2025-BRKT-09</CustomTag>
  </Extensions>

</QIFDocument>
```

---

### **Explication des sections**

| Section                  | Description                                                                    |
| ------------------------ | ------------------------------------------------------------------------------ |
| **Header**               | Métadonnées : logiciel, auteur, date, organisation, version, description.      |
| **Product**              | Informations sur la pièce inspectée, lien avec un modèle CAO (ex. STEP AP242). |
| **MeasurementResources** | Détails sur la machine, le logiciel de mesure et l'opérateur.                  |
| **Plans**                | Plan de mesure prévu, incluant les features critiques et leurs tolérances.     |
| **MeasurementResults**   | Résultats mesurés, avec écarts (`Deviation`) et statut (`PASS` ou `FAIL`).     |
| **Statistics**           | Moyennes, écarts-types, indices de capabilité (Cp, Cpk) pour analyse qualité.  |
| **Extensions**           | Balises personnalisées pour informations spécifiques (notes, identifiants).    |

---

### **Caractéristiques clés**

* **Lisible par l’humain** : XML clair, facilement navigable.
* **Interopérable** : Compatible avec logiciels de métrologie (Zeiss, Hexagon, Mitutoyo, etc.).
* **Extensible** : Permet d’ajouter des balises spécifiques sans casser la structure standard.
* **Auditabilité** : Idéal pour les rapports de qualité, traçabilité des lots, et conformité ISO.

---

Veux-tu que je te montre un **script Python** pour lire ce QIF et extraire automatiquement les mesures en tableau ?
