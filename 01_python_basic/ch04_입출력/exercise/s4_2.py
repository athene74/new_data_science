def print_max(num1, num2, num3, num4):
    if num1>num2:
        max_num=num1
    else:
        max_num=num2

    if max_num<num3:
        max_num=num3
    if max_num<num4:
        max_num=num4


    print(f'가장 큰 수는 {max_num}입니다.\n')

num_list =input("네개 숫자를 입력하여 주세요 예) 20 10 15 1 : ").split()
print_max(num_list[0], num_list[1], num_list[2], num_list[3])