# newfile.py
f = open("새파일.txt", 'w')
f.close()

# newfile2.py
# 절대 경로로 파일 생성
f = open("D:/doit/새파일.txt", 'w')
f.close()

# newfile2.py
# 상대 경로로 파일 생성
# . : 파이썬 파일이 있는 디렉토리
f = open("./doit/새파일.txt", 'w')
f.close()