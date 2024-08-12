def add_many(*args):
    result = 0
    for i in args:
        result = result + i   # *args에 입력받은 모든 값을 더한다.
    return result

add(1,2)
# 함수에서 정의한 파라메터 갯수를 맞추지 않고 호출시 에러
# add(1,2,3) 정의한 파라메터보다 많으면 에러
# add(1) 적어도 에러
result =add_many(1,2,3)
