a = [1,2,3,4]
result = []
# 입문자는 간단한 코드도 아래 스타일로 적용할 것
# 디버깅, 코드분석 능력을 향상시키기 위해서
for num in a:
    result.append(num*3)

print(result)

# 간단한 표현식을 통하여 리스트의 값을 생성하고자 할 때
# 유용한 문법
# 장점: 코드를 간단하게 작성할 수 있다.
# 단점: 디버깅에 제약사항이 있다.
#      2줄 이상 복잡한 표현식을 적용하기 어렵다.
result = [ num * 3 for num in a ]
print(result)

# if는 리스트 추가시 필터링 되는 조건을 지정한다.
result = [ num * 3 for num in a if num %2 == 0 ]
print(result)