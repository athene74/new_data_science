def menu():
    return input("""
    <함수 수업자료>
    1. 데이터조회
    2. 데이터수정
    3. 데이터삽입
    4. 데이터삭제
    5. 종료(엔터)
    """)

while True:
    choice = menu()
    if not choice: break