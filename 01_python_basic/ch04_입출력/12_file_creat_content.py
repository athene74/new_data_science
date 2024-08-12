# write_data.py
# w 모드:
# - 새로운 파일 생성, 기존에 파일이 있다면 overwrite
# default로 생성하면 파일 인코딩타입이 UTF-8
# 한글문자는 UTF-8이 범용적이다.
# 윈도우 시스템인 경우는 한글에디터에 따라 cp949 인코딩 타입을 많이 사용한다.
# 과거 인코딩 타입으로 EUC-KR도 있다.
f = open("./doit/새파일.txt", 'w')
for i in range(1, 11):
# for i in range(11, 21):
    data = "%d번째 줄입니다.\n" % i
    f.write(data)
f.close()
