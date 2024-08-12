num1 = int(input('첫 번째 수를 입력하세요: '))
num2 = int(input('두 번째 수를 입력하세요: '))
if num1 > num2:
    print(f'더 큰 수는 {num1}입니다.')
elif num1 < num2:
    print(f'더 큰 수는 {num2}입니다.')
else:
    print('두 수는 같습니다.')