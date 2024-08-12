# open 함수 수행하면 파일의 제일 첫줄 시작
# 위치에 파일포인트를 가리킨다.
f = open("./doit/새파일.txt", 'r')
# readline(): 현재 파일포인트에서 한줄 읽고
# 다음 줄로 파일포인트 이동
line=f.readline()
# print 함수를 default 옵션으로 수행하여 파일의
# 한줄을 출력하면 추가적으로 줄바꿈이 더 들어간다.
# print(line)
print(line, end = '')
line=f.readline()
print(line)
f.close()
