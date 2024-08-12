# 함수 정의
# 함수: 자주 사용하는 기능(실행문의 집합)을 구조화
# def 함수명(매개변수1, ... 매개변수N)
# 매개변수(parameter)
# 함수는 호출을 받아야 실행할 수 있다. 단독으로 실행 X
def add(number1, number2):
    print("Trace7")
    result = number1 + number2
    print("Trace9")
    return result

print("Trace12")
input_number1 = 3
print("Trace14")
input_number2 = 4

print("Trace17")
# 함수 호출
# 함수명(실행인자1, .. ,실행인자N), 실행인자(argument)
sum = add(input_number1,input_number2)
print("Trace21")

print(sum)
print("Trace24")
