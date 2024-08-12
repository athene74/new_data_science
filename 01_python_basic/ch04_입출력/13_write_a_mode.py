# write_data.py
# a 모드:
# - 파일이 없으면 새로 생성(w 모드와 동일)
#

f = open("./doit/새파일.txt", 'w')
for i in range(1, 11):
# for i in range(11, 21):
    data = "%d번째 줄입니다.\n" % i
    f.write(data)
f.close()
