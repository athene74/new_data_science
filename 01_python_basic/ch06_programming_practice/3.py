# A씨는 게시판 프로그램을 작성하고 있다. 그런데 게시물의 총 개수와 한 페이지에 보여 줄 게시물 수를 입력으로 주었을 때 총 페이지 수를 출력하는 프로그램이 필요하다고 한다.

# 이렇게 게시판의 페이지 수를 구하는 것을 ‘페이징’이라고 부른다.

# 함수 이름은? get_total_page
# 입력받는 값은? 게시물의 총 개수(m), 한 페이지에 보여 줄 게시물 수(n)
# 출력하는 값은? 총 페이지 수

def get_total_page(m,n):
    result = 0
    result = m // n + 1
    result = m // n
    if m % n == 0:
        result = m // n
    else:
        result = m // n +1
    return  result

# 테스트 케이스: 프로그램의 기능을 확인하기 위한 값
# TC1 : (10,4) => 3
# TC1 : (10,3) => 4
# TC1 : (8,4) => 2

# 테스트 단계
# TC1 : (10,4)
# Pass
print(get_total_page(10,4))

# TC1 : (10,3) => 4
# Pass
print(get_total_page(10,3))

# TC1 : (8,4) => 2
# Fail
print(get_total_page(8,4))