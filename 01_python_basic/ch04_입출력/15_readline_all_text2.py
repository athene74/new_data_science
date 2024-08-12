# readline_test.py
# open 함수 수행하면 파일의 제일 첫줄 시작
# 위치에 파일포인트를 가리킨다.
f = open("./doit/새파일.txt", 'r')
while True:
    line = f.readline()
    if not line: break
    print(line, end='')

f.close()

