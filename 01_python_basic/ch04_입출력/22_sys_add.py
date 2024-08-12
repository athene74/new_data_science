import sys
args = sys.argv[1:]

# 프로그램 인자는 무조건 문자열 타입으로 인식
# 활용하는 용도에 따라 형변환 필요
num1 = int(args[0])
num2 = int(args[1])

result = num1 + num2

print(f'{num1}+{num2}={result}')



