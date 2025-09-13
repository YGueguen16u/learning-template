# Exercice 1 : Image

```bash
pip install opencv-python
```

```python
import cv2
import matplotlib.pyplot as plt

# Import of the image
img = cv2.imread("mushroom32_32.png")
img = np.int64(img)

# Display of the image
_ = plt.imshow(img[:, :, ::-1])
_ = plt.axis("off")
```
- If you execute the code, execute from the directory of the code file and not from the root of the project.

```bash
cd courses_and_exercises/03_python/02_useful_lib_for_data/01_numpy
python3 try.py

# do not : python3 courses_and_exercises/03_python/02_useful_lib_for_data/01_numpy/try.py
```

- `np.int64(img)` : Convert the image to a numpy array of type int64.

- The image is stored in the array img. Display the shape of the created array.

```python
print(img.shape)
```

- Function to see the pixel values of the image and the mean of the pixel values.

```python
def visualize_pixel_and_its_mean(img, i, j):
    """
    Visualize the pixel values of the image.

    Args:
        img (numpy.ndarray): The image to visualize.
    
    Returns:
        str: The pixel values of the image.
    """
    assert i >= 0 and i < img.shape[0], "i is out of bounds"
    assert j >= 0 and j < img.shape[1], "j is out of bounds"

    message = (f"Pixel for {i}-th line and {j}-th column : {img[i, j]}"
               f"\nMean of the pixel : {np.mean(img[i, j])}")
    return message
```

- Understand the strcuture of the image.

```python
[ # img
    [ # l1
        [
            "l1c1p1",  # p1
            "l1c1p2",  # p2
            "l1c1p3"   # p3
        ] # c1
        [
            "l1c2p1",  # p1
            "l1c2p2",  # p2
            "l1c2p3"   # p3
        ] # c2
        [
            "l1c3p1",  # p1
            "l1c3p2",  # p2
            "l1c3p3"   # p3
        ] # c3
    ]
    [
        [
            "l2c1p1",  # p1
            "l2c1p2",  # p2
            "l2c1p3"   # p3
        ] # c1
        [
            "l2c2p1",  # p1
            "l2c2p2",  # p2
            "l2c2p3"   # p3
        ] # c2
        [
            "l2c3p1",  # p1
            "l2c3p2",  # p2
            "l2c3p3"   # p3
        ] # c3
    ] # l2
]
```

- To transform an image in color to an image in grayscale, it suffices, for each pixel of the image, to make the average of the intensities of the color channels.

We will have to iterate over each pixel of the image, but for numpy arrays with multiple dimensions, iterations must be done dimension by dimension :

```python
   # Création d'un array de dimensions 32x32x3   (lignes x colonnes x canaux)
   X = np.zeros(shape = (32, 32, 3))

   # Itération sur la première dimension de l'array (les lignes)
   for ligne in X:
       # Itération sur la deuxième dimension de l'array (les pixels de la ligne)
       for pixel in ligne:
           # Itération sur la troisième dimension de l'array (les canaux du pixel)
           for canal in pixel:
               ...
               ...
```

A pixel of the image is therefore an array of 3 elements corresponding to the intensities of the color channels.
We can make the average of these three elements to obtain the brightness of the pixel in grayscale.

- Write a function named rgb_to_gray to perform the grayscale conversion

1 . Create a new array X_gray having the same number of rows and columns as the input image, but with only one channel.

2 . Iterate over the image and calculate the average intensity for each pixel.

3 . Store the average intensity at the corresponding position in X_gray.

```python
# given ligne = i and given column = j find the mean of the three pixels
# np.mean(X[i, j])

[ # img
    [ # l1
        ["l1c1g"] # c1
        ["l1c2g"] # c2
        ["l1c3g"] # c3
    ]
    [
        ["l2c1g"] # c1
        ["l2c2g"] # c2
        ["l2c3g"] # c3
    ]
]
```

```python
def rgb_to_gray(img):
    """
    Convert an image from RGB to grayscale.

    Args:
        img (numpy.ndarray): The image to convert.
    
    Returns:
        numpy.ndarray: The grayscale image.
    """
    assert img.shape[2] == 3, "The image must be in RGB format"
    assert img.dtype == np.int64, "The image must be of type int64"
    
    # define number of rows and columns
    rows, cols = img.shape[:2]
    
    # create a new array with the same number of rows and columns but with only one channel
    X_gray = np.zeros(shape = (rows, cols))
    
    # iterate over the image and calculate the average intensity for each pixel
    for i in range(rows):
        for j in range(cols):
            X_gray[i, j] = np.mean(img[i, j])
    
    return X_gray
```

- Display the grayscale image.

```python
if __name__ == "__main__":
    img = cv2.imread("mushroom32_32.png")
    img = cv2.resize(img, (32, 32))
    img = np.int64(img)  # Convertir en int64 une seule fois

    print(img.shape)
    print(visualize_pixel_and_its_mean(img, 16, 16))
    print(type(img.shape))

    # Display the image in color
    plt.subplot(1, 2, 1)  
    plt.imshow(img[:, :, ::-1])  
    plt.axis("off") 
    plt.title("Image en couleur") 

    # Display the image in grayscale
    plt.subplot(1, 2, 2)  
    plt.imshow(rgb_to_gray(img), cmap="gray") 
    plt.axis("off")
    plt.title("Image en niveaux de gris") 

    plt.show()
```




