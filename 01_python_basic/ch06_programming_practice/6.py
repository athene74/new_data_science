# 문제 정의
# 특정 디렉터리부터 시작해서 그 하위(디렉터리 포함)의 모든 파일 중 파이썬 파일(*.py)만 출력해 주는 프로그램을 만들려면 어떻게 해야 할까?
#
# 필요한 기능은? 파이썬 파일만 찾아서 출력하기
# 입력받는 값은? 검색을 시작할 디렉터리
# 출력하는 값은? 파이썬 파일명

# Step1] 함수 프로토타입 정의 및 테스트

def search(dirname):
    print(dirname)

search("c:/")

# Step2] os.wali 구현
import os

# oswalk.py
import os

for (path, dir, files) in os.walk("D:\\hjnam\\project\\DataScience\\01_python_basic\\ch06_programming_practice"):
    for filename in files:
        ext = os.path.splitext(filename)[-1]
        if ext == '.py':
            print("%s\\%s" % (path, filename))


