# 파이참에서 실행인자를 실행하려면
# 메뉴 - run - edit -configuration -script parameter에 설정을 한다.
# 주의사항] 해당 설정을 하기위해 해당 프로그램을 에러가 나더라도 한번 수행을 해야지
# 위 메뉴에서 설정할 수 있다.
import sys
args = sys.argv[1:]

# 프로그램 인자는 무조건 문자열 타입으로 인식
# 활용하는 용도에 따라 형변환 필요
num1 = int(args[0])
num2 = int(args[1])

result = num1 + num2

print(f'{num1}+{num2}={result}')