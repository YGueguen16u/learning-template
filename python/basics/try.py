nested_tuple = ("Hello", {"key_1": "value_1", "key_2": "value_2"}, [1, 2, 3], (("hello !", 5), ("hello !", 6)))
print(nested_tuple[0][2])   # l
print(nested_tuple[1]["key_2"])   # value_2
print(nested_tuple[3][1][1])   # 6