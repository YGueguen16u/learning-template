<h3 id="from-list">2. Depuis une liste Python</h3>

```python
arr = np.array(
  object=[1, 2, 3, 4, 5],
  dtype=np.int64,
  ndmin=1)
print(arr)
print(type(arr))  # <class 'numpy.ndarray'>

arr_2 = np.array(
  object=[[1, 2, 3], [4, 5, 6]],
  dtype=np.int64,
  ndmin=2)
print(arr_2) # [[1 2 3] [4 5 6]]
print(type(arr_2))  # <class 'numpy.ndarray'>

arr_2_bis = np.array([[1, 2, 3], [4, 5, 6]], 
  dtype=np.int64,
  ndmin=4
)
print(arr_2_bis) # [[[[1 2 3] [4 5 6]]]]
print(type(arr_2_bis))
```

- `object` : the array data.
- `dtype` : the array data type.
  - `np.int64` : 64-bit integer.
  - `np.float64` : 64-bit float.
  - `np.bool_` : boolean.
  - `np.complex128` : 128-bit complex.
- `ndmin` : the minimum number of dimensions.

<h3 id="from-list-comprehension">2. Depuis une liste Python par compréhension</h3>

```python
arr = np.array([2*i for i in range(10)])    # 0, 2, 4, 6, ..., 18
```


<h3 id="quick-creation">3. Fonctions de création rapide</h3>

L'argument de ces constructeurs est en général un******`**tuple`****contenant les dimensions de la matrice souhaitées. 
Ce tuple de dimensions est ce qu'on appelle la****shape****d'un array.

<h4 id="zeros">a) Tableaux remplis de zéros</h4>

```python
zeros = np.zeros(5)
zeros_bis = np.zeros(shape=(5,))
print(zeros)  # [0. 0. 0. 0. 0.]
print(zeros_bis)  # [0. 0. 0. 0. 0.]

print(zeros.shape)  # (5,)
print(zeros.dtype)  # float64
print(zeros.ndim)  # 1
print(zeros.size)  # 5

zeros_2 = np.zeros(shape=(5, 3), dtype=np.int64)
print(zeros_2.shape)  # (5, 3)
print(zeros_2.dtype)  # int64
print(zeros_2.ndim)  # 2
print(zeros_2.size)  # 15
```

<h4 id="zeros_like">a) Tableaux remplis de zéros de la même forme qu'un autre tableau</h4>

```python
zeros_like = np.zeros_like(a = zeros_2)
print(zeros_like)  # [[0. 0. 0.] [0. 0. 0.]]
```

<h4 id="ones">b) Tableaux remplis de uns</h4>

```python
ones = np.ones(shape=(5,), dtype=np.int64)
print(ones)  # [1 1 1 1 1]

ones_2 = np.ones(shape=(5, 3), dtype=np.complex128)
print(ones_2)  # [[1.+0.j 1.+0.j 1.+0.j] [1.+0.j 1.+0.j 1.+0.j] ...]
print(ones_2.shape)  # (5, 3)
```

<h4 id="ones_like">c) Tableaux remplis de uns de la même forme que un autre tableau</h4>

```python
ones3 = np.array([[[1, 2, 3], [4, 5, 6]], [[1, 2, 3], [4, 5, 6]]], dtype=np.int64)
ones_like = np.ones_like(a = ones3, dtype=np.float64)
print(ones_like)  # [[[1. 1. 1.] [1. 1. 1.]] [[1. 1. 1.] [1. 1. 1.]]]
```

<h4 id="eye">d) Matrice identité avec `eye`</h4>

- `eye` returns a matrix with ones on the diagonal and zeros elsewhere.
  - `N` : the number of rows.
  - `M` : the number of columns.
    - if not specified, `M` is set to `N`.
    - can be different from `N`.
  - `k` : the diagonal to place ones on.
    - `k=0` : the main diagonal.
    - `k>0` : the diagonal above the main diagonal.
    - `k<0` : the diagonal below the main diagonal.
  - `dtype` : the data type of the array.

- don't use `shape` to create an identity matrix

```python
eye = np.eye(
  N=5, 
  M=5,
  k=2,
  dtype=np.int64
)
print(eye)  # [[0. 0. 1. 0. 0.] [0. 0. 0. 1. 0.] ...]
print(type(eye))  # <class 'numpy.ndarray'>
```

<h4 id="empty">e) Tableau vide</h4>

- `empty` returns an array without initializing its values, its values are those of the memory at that location before.
  - `shape` : the shape of the array.
  - `dtype` : the data type of the array.

```python
arr_empty = np.empty(shape=(5,), dtype=int)
print(arr_empty)  # valeurs aléatoires de la mémoire
```

<h4 id="arange">d) Plage de valeurs avec `arange`</h4>

- `arange` returns values with a fixed step size.
  - `start` : the starting value.
  - `stop` : the stopping value.
  - `step` : the step size.

```python
arr_range = np.arange(
  start=0,
  stop=10,
  step=2,
  dtype=np.int64
)
print(arr_range)  # [0 2 4 6 8]
```


<h4 id="linspace">d) Plage linéaire avec `linspace`</h4>

- `linspace` returns values with a fixed number of elements.
  - `start` : the starting value.
  - `stop` : the stopping value.
  - `num` : the number of elements.
  - `endpoint` : whether to include the stop value.
  - `retstep` : whether to return the step size.
  - `dtype` : the data type of the array.
  - `axis` : the axis along which to perform the operation.
    - `axis=0` : the first dimension.
    - `axis=-1` : the last dimension.

```python
arr_lin = np.linspace(
  start=0,
  stop=1,
  num=5,
  endpoint=True,
  retstep=True,
  dtype=np.int64,
  axis=0
)
print(arr_lin)  
# (array([0.        , 0.05555556, 0.11111111, 0.16666667, 0.22222222,
#        0.27777778, 0.33333333, 0.38888889, 0.44444444, 0.5       ]), 
# np.float64(0.05555555555555555)) 

arr_lin_2 = np.linspace(
  start=0,
  stop=1,
  num=5,
  axis=-1
)
print(arr_lin_2.shape)  # (5,)
```

<h4 id="logspace">Tableaux logarithmiques</h4>

- `logspace` returns values with a fixed number of elements on a logarithmic scale.
  - `start` : the starting value.
  - `stop` : the stopping value.
  - `num` : the number of elements.
  - `endpoint` : whether to include the stop value.
  - `base` : the base of the logarithm.
  - `dtype` : the data type of the array.

```python
arr_log = np.logspace(
  start=0,
  stop=8,
  num=5,
  endpoint=True,
  base=2,
  dtype=np.float64
)
print(arr_log)  # [1. 4. 16. 64. 256.]
```

<h4 id="random">Tableaux aléatoires</h4>

- `rand` returns random values in the range [0,1).
- `randn` returns random values from a standard normal distribution.

- `randint` returns random values from a uniform distribution.
  - `low` : the lower bound of the range.
  - `high` : the upper bound of the range, not included.
  - `size` : the size of the array.
  - `dtype` : the data type of the array.

```python
random_uniform = np.random.rand(3, 5, 7, 4)  # [0,1) uniforme
random_normal = np.random.randn(5)  # distribution normale centrée réduite
random_int = np.random.randint(
  low=0,
  high=10,
  size=(5,6, 4)
)  # [0,10) uniforme
```