# 두 수의 크기 비교
num1 = int(input("첫 번째 수를 입력하세요: "))
num2 = int(input("두 번째 수를 입력하세요: "))

if num1 > num2:
    max = num1
elif num1 < num2:
    max = num2
else:
    print("두 수는 같습니다.")

print(f"더 큰 수는 {max}입니다.")
