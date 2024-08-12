"""
파라메터 O, 리턴 X 함수
함수 외부에서 입력값을 처리
"""
# 실행인자와 파라메터는 동일한 이름을 사용할 수 있다.
def add(input_number1, input_number2):

    result = input_number1 + input_number2

    print(f'{input_number1} + {input_number2} = {result}')

print("- 알파랩 두 수 덧셈 연산기\n")

input_number1 = int(input('첫번째 수를 입력하세요: '))
input_number2 = int(input('두번째 수를 입력하세요: '))
sum = add(input_number1, input_number2)

print("\n프로그램 종료")
