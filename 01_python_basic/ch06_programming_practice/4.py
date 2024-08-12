# C:/doit/memo.py
# Step1] 실행인자 확인
# import sys
#
# option = sys.argv[1]
# memo = sys.argv[2]
#
# print(option)
# print(memo)

# Step2] 메모 추가 -a 모드
# C:/doit/memo.py
# import sys
#
# option = sys.argv[1]
#
# if option == '-a':
#     memo = sys.argv[2]
#     f = open('memo.txt', 'a')
#     f.write(memo)
#     f.write('\n')
#     f.close()

# c:/doit/memo.py
import sys

option = sys.argv[1]

if option == '-a':
    memo = sys.argv[2]
    f = open('memo.txt', 'a')
    f.write(memo)
    f.write('\n')
    f.close()
elif option == '-v':
    f = open('memo.txt')
    memo = f.read()
    f.close()
    print(memo)

