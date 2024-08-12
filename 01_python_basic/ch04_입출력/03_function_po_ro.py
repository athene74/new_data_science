"""
파라메터 O, 리턴 O 함수
함수의 입출력은 외부에서 처리하고 함수는 핵심 알고리즘만 처리한다.
"""
# 실행인자와 파라메터는 동일한 이름을 사용할 수 있다.
def add(input_number1, input_number2):

    result = input_number1 + input_number2

    return result


print("- 알파랩 두 수 덧셈 연산기\n")

input_number1 = int(input('첫번째 수를 입력하세요: '))
input_number2 = int(input('두번째 수를 입력하세요: '))
result = add(input_number1, input_number2)
print(f'{input_number1} + {input_number2} = {result}')

print("\n프로그램 종료")
