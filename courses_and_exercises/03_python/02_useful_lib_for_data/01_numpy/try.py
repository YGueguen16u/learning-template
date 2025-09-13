import numpy as np

arr_4 = np.array([[[[1, 2, 3], [4, 5, 6]], [[1, 2, 3], [4, 5, 6]]]])
print(arr_4[0, 0, 0, 0])  # 1
print(arr_4[-1, -1, -1, -1])  # 6
print(arr_4[0, 0, -1, -1])  # 6
print(arr_4[0, -1, -1, -1])  # 6
print(arr_4[0, 0, 0, ::-1])