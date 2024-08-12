# 이번에는 문서 파일을 읽어서 그 문서 파일 안에 있는 탭 문자(Tab)를 공백 문자(Space) 4개로 바꾸어 주는 스크립트를 작성해 보자.
#
# 필요한 기능은? 문서 파일 읽어 들이기, 문자열 변경하기
# 입력받는 값은? 탭을 포함한 문서 파일
# 출력하는 값은? 탭이 공백으로 수정된 문서 파일

# 예) python 5.py src dst
# a.txt
"""
Life    is  too short
You need    python
"""

# Step1] 실행인자 확인
# import sys
#
# src = sys.argv[1]
# dst = sys.argv[2]
#
# print(src)
# print(dst)

# Step2] Space 변환 테스트
# c:/doit/tabto4.py
import sys

src = sys.argv[1]
dst = sys.argv[2]

f = open(src)
tab_content = f.read()
f.close()

# 최신 버전의 파이참 에디터창에서 tab 입력시 tab이 space로 변환되어 입력되므로
# a.txt는 노트패드에서 작성할 것
space_content = tab_content.replace("\t", " "*8)
print(space_content)


# Step3] 최종 구현
# c:/doit/tabto4.py
import sys

src = sys.argv[1]
dst = sys.argv[2]

f = open(src)
tab_content = f.read()
f.close()

space_content = tab_content.replace("\t", " "*4)

f = open(dst, 'w')
f.write(space_content)
f.close()



