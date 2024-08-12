a = "Python is the best choice"

# 동일 기능
print(a.find('best'))
print(a.index('best'))

# 검색되지 않는 값 처리 방식
# find
# 검색하지 못할 경우 -1 반환
print(a.find('k'))
if(a.find('k')==-1):
    print('k를 찾을 수 없습니다')
print('작업1')
# 검색하지 못할 경우 런타임 에러 발생
# print(a.index('k'))
# print('작업2')

a = 'alpha0001'
print(a)
# Out[120]: 'alpha0001'
a.upper()
# 문자열의 값을 대문자로 변경하여 반환
# Out[121]: 'ALPHA0001'
# 자기 자신의 값을 바꾸진 못한다.
# 문자열의 내부값은 변경 불가능한 타입이기 때문에
print(a)
# Out[122]: 'alpha0001'
# 따라서 문자열 함수의 결과값을 재사용하기 위해서는
# 결과값을 새로운 변수에 저장해야 한다.
new_id = a.upper()
print(a)
# Out[124]: 'alpha0001'
print(new_id)
# Out[125]: 'ALPHA0001'
# 자기 자신의 값을 변경하기 위해서는
# 변수 값을 재 할당하여 변수의 값이 변경되는 효과를
# 갖게 한다.
a = a.upper()
print(a)
# Out[127]: 'ALPHA0001'
# * 리스트 사용 목적
# 동일한 성격의 데이터를 하나의 변수로 관리 가능
# * 학번데이터
# 'a01', 'a02', ........ 'a13'
# id1 = 'a01'
# id2 = 'a02'
# ....
# id13 = 'a13'
# * 성적데이터
# 98,54,89, .... ,13
# score1 = 98
# score2 = 54
# ...
# score13=13

# 기존 변수로 처리할 경우 데이터 요소 갯수 만큼 변수명을 선언해야 한다.
# 변수명에서 변수명은 중복적인 내용이 있고 서로 다른 내용은 인덱스로 구분하는 패턴이 생긴다.
# 그래서 리스트와 같은 데이터 타입이 생겨났다.
# * 리스트 문법
# 리스트변수명=[요소값1, 요소값2,...., 요소값n]
ids = ['a01', 'a02','a03','a04','a05']
# 리스트 요소 접근
# 리스트명[인덱스번호]
ids[0]
ids[1]
ids[2]
ids[3]
ids[4]
print(ids[0])
print(ids[1])
print(ids[2])
print(ids[3])
print(ids[4])
scores = [100, 98, 38, 40, 87]
scores[0]
scores[1]
scores[2]
scores[3]
scores[4]
print(scores[0])
print(scores[1])
print(scores[2])
print(scores[3])
print(scores[4])