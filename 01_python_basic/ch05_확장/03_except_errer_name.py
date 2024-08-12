# try_except.py
print('프로그램시작')
# STEP1] 프로그램 작성 및 구동시 오류 발견
# 4/0
# print('프로그램 종료')
#
# STEP2] 예외 종료 확인 후 예외처리 추가
# try:
#     4/0
# except ZeroDivisionError:
#     print('0으로 수를 잘못 나누었습니다')
#
# print('프로그램 종료')

# STEP3] 에러 상황 자동출력
try:
    4 / 0
except ZeroDivisionError as e:
    print(e)
print('프로그램 종료')

에러 단순 회피
try:
    4/0
except:
    pass

# 최상위 Exception 클래스를 사용하여
# 모든 종류의 에러에 대해 대용
try:
    4/0
    f=open('나없는파일','r')
except Exception as e:
    print(e)

print("프로그램 종료")

