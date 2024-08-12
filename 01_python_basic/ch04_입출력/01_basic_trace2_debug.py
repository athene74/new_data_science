# 함수 정의
# 함수: 자주 사용하는 기능(실행문의 집합)을 구조화
# def 함수명(매개변수1, ... 매개변수N)
# 매개변수(parameter)
# 함수는 호출을 받아야 실행할 수 있다. 단독으로 실행 X
def add(number1, number2):
    # 함수에서 선언한 변수는 지역변수(Local Variable)
    # 함수 지역변수는 함수 종료 후 값이 소멸된다.
    result = number1 + number2
    # return 함수 수행 종료시 호출한 곳으로 반환하는 값
    return result

input_number1 = 3
input_number2 = 4

# 함수 호출
# 함수명(실행인자1, .. ,실행인자N), 실행인자(argument)
sum = add(input_number1,input_number2)
# 호출 이후 아래와 값이 return 값으로 치환된다.
# sum = 7

print(sum)
