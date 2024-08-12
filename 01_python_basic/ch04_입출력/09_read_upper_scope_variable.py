# 변수 스코프(Variable Scope)
# 변수가 각 실행문 블록(Statement Block)에서 참조할 수 있는

# vartest.py
# 최상위 Statement Block: vartest함수 블록 제외
# 최상위 statement blocd에서 사용하는 변수
# => 전역변수(Global Variable)
print('main 프로그램 실행')
a=1

def vartest(): # vartest 함수 블록
    print('varteat 함수 실행')
    # 하위 스코프에서 상위스코프의 변수 변경 가능
    print(a)

# 상위 scope에서 하위 scope 변수를 참조는 X
vartest()