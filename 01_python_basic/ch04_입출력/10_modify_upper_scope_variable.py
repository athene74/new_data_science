# 변수 스코프(Variable Scope)
# 변수가 각 실행문 블록(Statement Block)에서 참조할 수 있는

# vartest.py
# 최상위 Statement Block: vartest함수 블록 제외
# 최상위 statement blocd에서 사용하는 변수
# => 전역변수(Global Variable)
print('main 프로그램 실행')
a=1

def vartest1(): # vartest 함수 블록
    global a
    print('varteat 함수 실행')

    # 하위 스코프에서 상위스코프의 변수 변경 가능
    a=a+1
    print(a)

# 상위 scope의 변수를 하위 scope 변수에서 참조, 변경시 장점
# 장점: 함수에서 실행인자를 생략할 수 있다.
# 단점: 상위 스코프의 값이 함부로 변경되지 않아야 될 상황에 취약할 수 있다.

# 상위 scope에서 하위 scope 변수를 참조는 X
vartest1()

def vartest2(b): # vartest 함수 블록
    b=b+1
    return b

b=1
#  상위 scope 에서 하위 scope 변수를 참조는 X
result = vartest2(b)
print(result)