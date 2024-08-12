"""
파라메터 X, 리턴 O 함수
함수 내부에서 입력값이 없거나 입력값을 처리하고 그 결과를 반환한다.
"""
# 실행인자와 파라메터는 동일한 이름을 사용할 수 있다.
def add():
    input_number1 = int(input('첫번째 수를 입력하세요: '))
    input_number2 = int(input('두번째 수를 입력하세요: '))
    result = input_number1 + input_number2

    # return은 한 가지 값만 반환 할 수 있다.
    # 아래는 (input_number1, input_number2, result) 라는 하나의 튜플을 반환
    # 즉, 튜플 자료형을 통하여 여러개의 값을 반환하는 효과를 낸다.
    return input_number1, input_number2, result


print("- 알파랩 두 수 덧셈 연산기\n")


input_number1, input_number2, result = add()
print(f'{input_number1} + {input_number2} = {result}')

print("\n프로그램 종료")
