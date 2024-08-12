registration_number = input("주민등록번호를 입력하세요 (ex. 123456-1234567): ")
gender_digit = int(registration_number[7])

if gender_digit == 1:
    gender = "남성"
else:
    gender = "여성"

print(f"입력한 주민등록번호는 {gender}입니다.")
