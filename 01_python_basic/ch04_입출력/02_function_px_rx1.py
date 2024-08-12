"""
파라메터 X, 리턴 X 함수
함수안에서 입력값 처리, 출력값 처리를 모두 수행한다.
모든 입출력 기능을 위임
"""
def add():
    input_number1 = int(input('첫번째 수를 입력하세요: '))
    input_number2 = int(input('두번째 수를 입력하세요: '))
    result = input_number1 + input_number2

    print(f'{input_number1} + {input_number2} = {result}')

print("- 알파랩 두 수 덧셈 연산기\n")

sum = add()

print("\n프로그램 종료")
