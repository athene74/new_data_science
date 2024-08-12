list1 = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]
list2 = [
    [3, 3, 3],
    [4, 4, 4],
    [5, 5, 5]
]

# for column_index in range(len(list1[0])):
#     print(column_index):
total_result = []

for row_index in range(len(list1)):
    # print(row_index)
    rows = []
    for column_index in range(len(list1[0])):
        # print(list2[row_index][column_index])
        rows.append(list1[row_index][column_index] + list2[row_index][column_index])
    total_result.append(rows)
