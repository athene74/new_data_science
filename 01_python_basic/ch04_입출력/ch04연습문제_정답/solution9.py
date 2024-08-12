# 사용자로부터 다섯 개의 숫자를 한 꺼번에 입력받음
numbers = input("다섯 개의 숫자를 한 꺼번에 입력하세요 (예시: 1 3 2 7 10): ").split()
numbers = [int(num) for num in numbers]

# 람다 함수를 사용하여 짝수만 필터링
even_numbers = list(filter(lambda x: x % 2 == 0, numbers))

# 결과 출력
print("짝수만 필터링된 결과:")
print(even_numbers)
