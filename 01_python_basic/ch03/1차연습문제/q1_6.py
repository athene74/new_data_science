username = input("아이디를 입력하세요: ")
password = input("비밀번호를 입력하세요: ")

if (username == 'admin') and (password == 'password'):
    print("로그인에 성공했습니다.")
else:
    print("로그인에 실패했습니다.")