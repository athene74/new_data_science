# 1~10까지 총합 구하는 예제

total = 0
number_list = [1,2,3,4,5,6,7,8,9,10]

# 누적값을 구하는 알고리즘
for number in number_list:
    total = total + number

print(f'1에서 10까지의 총합은 {total}입니다.')

total =0
for number in range(1,101):
    total = total + number
print(f'1에서 10까지의 총합은 {total}입니다.')

