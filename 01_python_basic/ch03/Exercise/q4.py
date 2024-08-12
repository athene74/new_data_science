num1 = int(input('첫 번째 숫자를 입력하세요: '))
num2 = int(input('두 번째 숫자를 입력하세요: '))
num3 = int(input('세 번째 숫자를 입력하세요: '))
# if num1 >= num2:
#     if num2 >= num3:
#             print(f'가장 큰 수는 {num1}입니다.')
#     else:
#        if num1 >= num3:
#             print(f'가장 큰 수는 {num1}입니다.')
#        else:
#             print(f'가장 큰 수는 {num3}입니다.')
# else:
#     if num2 >= num3:
#         print(f'가장 큰 수는 {num2}입니다.')
#     else:
#         print(f'가장 큰 수는 {num3}입니다.')

max_num = num1

if num2 > max_num:
    max_num = num2
    if num3 >max_num:
        max_num = num3
print(f'가장 큰 수는 {max_num}입니다.')