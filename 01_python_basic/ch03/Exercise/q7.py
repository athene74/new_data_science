reg_num = input('주민등록번호를 입력하세요(ex. 123456-1234567): ')
gender = reg_num[7]
if (gender == '1') or (gender == '3'):
    gender = '남성'
elif (gender == '2') or (gender == '4'):
    gender = '여성'
else:
    pass

print(f'입력한 주민등록번호는 {gender}입니다.')