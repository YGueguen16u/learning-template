# 1. CityJSON Object

A CityJSON object represents one 3D city model of a given area, this model may contain features of different types, as defined in the CityGML data model.

A CityJSON object:

- is a **JSON object**.

- must have one member with the name "type". The value must be "CityJSON".

    ```json
    "type": "CityJSON"
    ```

- must have one member with the name "version". The value must be a string with the version (X.Y) of the CityJSON object. Observe that while schemas can have a version with patch version (X.Y.Z), a CityJSON object points only to the minor version (X.Y), and for validation the latest schema of that minor version should be used.

    ```json
    "version": "2.0"
    ```

- must have one member with the name "transform". The value is a JSON object describing how to decompress the integer coordinates of the geometries to obtain real-world coordinates. See § 4 Transform Object for details.

    ```json
    "transform": {
        "scale": [1.0, 1.0, 1.0],
        "translate": [0.0, 0.0, 0.0]
    }
    ```

- must have one member with the name "CityObjects". The value of this member is a collection of key-value pairs, where the key is the ID of the object, and the value is one City Object. The ID of a City Object should be unique (within one CityJSON Object). See § 2 The different City Objects for details.

    ```json
    "CityObjects": {
        "id-1": {
            "type": "Building",
            "geographicalExtent": [ 84710.1, 446846.0, -5.3, 84757.1, 446944.0, 40.9 ], 
            "attributes": { 
                "measuredHeight": 22.3,
                "roofType": "gable",
                "owner": "Elvis Presley"
            },
            "children": ["id-2"],
            "geometry": [{...}]
        },
        "id-2": {
            "type": "BuildingPart", 
            "parents": ["id-1"],
            "children": ["id-3"],
            ...
        },
        "id-3": {
            "type": "BuildingInstallation", 
            "parents": ["id-2"],
            ...
        },
        "id-4": {
            "type": "LandUse", 
            ...
        }
    }
    ```

- must have one member with the name "vertices". The value is an array representing the coordinates of each vertex of the city model. See § 3.1 Coordinates of the vertices.

    ```json
    "vertices": [
        [102, 103, 1],
        [11, 910, 43],
        [25, 744, 22],
        ...
        [23, 88, 5],
        [8523, 487, 22]
    ]
    ```

- may have one member with the name "metadata". The value may be a JSON object describing the coordinate reference system used, the extent of the dataset, its creator, etc. See § 5 Metadata for details.

    ```json
    "metadata": {
        "geographicalExtent": [ 84710.1, 446846.0, -5.3, 84757.1, 446944.0, 40.9 ],
        "identifier": "eaeceeaa-3f66-429a-b81d-bbc6140b8c1c",
        "pointOfContact": {
            "contactName": "3D geoinformation group, Delft University of Technology",
            "contactType": "organization",
            "role": "owner",
            "phone": "+31-6666666666",
            "emailAddress": "3dgeoinfo-bk@tudelft.nl",
            "website": "https://3d.bk.tudelft.nl",
            "address": {
                "thoroughfareNumber": "134",
                "thoroughfareName": "Julianalaan",
                "locality": "Delft",
                "postcode": "2628BL",
                "country": "the Netherlands"
            }
        },
        "referenceDate": "1977-02-28",
        "referenceSystem": "https://www.opengis.net/def/crs/EPSG/0/2355",
        "title": "Buildings in LoD2.3 of Chibougamau, Québec"
    }
    ```

- may have one member with the name "extensions", which is used if there are Extensions used in the file. See § 8 Extensions for details.

    ```json
    {
    "type": "CityJSON",
    "version": "2.0",
    "extensions": {
        "Noise": {
        "url" : "https://someurl.org/noise.json",
        "version": "2.0"
        },
        "Solar_Potential": {
        "url" : "https://someurl.org/solar.json",
        "version": "0.8"
        }
    },
    "CityObjects": {},
    "vertices": []
    }
    ```

- may have one member with the name "appearance". The value may contain JSON objects representing the textures and/or materials of surfaces. See § 6 Appearance Object for details.

    ```json
    "appearance": {
    "materials": [],
    "textures":[],
    "vertices-texture": [],
    "default-theme-texture": "myDefaultTheme1",
    "default-theme-material": "myDefaultTheme2"
    }
    ```

- may have one member with the name "geometry-templates", the value is a JSON object containing the templates that can be reused by different City Objects (usually for trees). This is equivalent to the concept of "implicit geometries" in CityGML. See § 3.4 Geometry templates for details.

    ```json
    "geometry-templates": {
    "templates": [
        {
        "type": "MultiSurface",
        "lod": "2.1",
        "boundaries": [ 
            [[0, 3, 2, 1]], [[4, 5, 6, 7]], [[0, 1, 5, 4]]
        ],
        "semantics": {
            "surfaces" : [
            {
                "type": "+Skylight",
            },
            {
                "type": "+PatioDoor",
            }
            ],
            "values": [0, 0, 1]
        }
        },
        {
        "type": "MultiSurface",
        "lod": "1.3",
        "boundaries": [ 
            [[1, 2, 6, 5]], [[2, 3, 7, 6]], [[3, 0, 4, 7]]
        ],
        "material": {...}
        }
    ],
    "vertices-templates": [
        [0.0, 0.5, 0.0],
        ...
        [1.0, 1.0, 0.0],
        [0.0, 1.0, 0.0]
    ]
    }
    ```

- may have other members, and their value is not prescribed. Because these are not standard members in CityJSON, they might be ignored by parsers.

**The minimal valid CityJSON object is:**

```json
{
  "type": "CityJSON",
  "version": "2.0",
  "transform": {
    "scale": [1.0, 1.0, 1.0],
    "translate": [0.0, 0.0, 0.0]
  },
  "CityObjects": {},
  "vertices": []
}
```

An "empty" but complete CityJSON object will look like this:

```json
{
  "type": "CityJSON",
  "version": "2.0",
  "extensions": {},
  "transform": {
    "scale": [1.0, 1.0, 1.0],
    "translate": [0.0, 0.0, 0.0]
  },
  "metadata": {},
  "CityObjects": {},
  "vertices": [],
  "appearance": {},
  "geometry-templates": {}
}
```

While the order of the CityJSON member values should preferably be as above, not all JSON generators support this, therefore the order is not prescribed.

