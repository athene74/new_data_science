numbers = input('네 개의 숫자를 한꺼번에 입력하세요 (예시: 1 3 2 7): ').split()
numbers = [int(num) for num in numbers]

# 람다 함수를 사용하여 짝수만 필터링
odd_numbers = list(filter(lambda x: x % 2 == 1, numbers))

print('홀수만 필터링된 결과: ')
print(odd_numbers)
