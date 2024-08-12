def print_max(num1, num2, num3):
    if num1>num2:
        max_num=num1
    else:
        max_num=num2

    if max_num<num3:
        max_num=num3
    print(f'가장 큰 수는 {max_num}입니다.\n')
    # print(f'{max_num}의 타입은 {type(max_num)}입니다')

num_list =input("세개 숫자를 입력하여 주세요 예) 20 10 15 ").split()
# print(type(num_list[1]))
print_max(num_list[0], num_list[1], num_list[2])