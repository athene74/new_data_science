age = int(input("나이를 입력하세요: "))

if age < 0:
    print("다시 입력하세요.")
    exit()
if age >= 0 and age <= 3:
    grade = "유아"
    fee = "무료"
elif age >= 4 and age <= 13:
    grade = "어린이"
    fee = 2000
elif age >= 14 and age <= 18:
    grade = "청소년"
    fee = 3000
elif age >= 19 and age <= 65:
    grade = "성인"
    fee = 5000
else:
    grade = "노인"
    fee = "무료"

if grade == "유아" or grade == "노인":
    print(f"귀하는 {grade} 등급이며 요금은 무료입니다.")
else:
    print(f"귀하는 {grade} 등급이며 요금은 {fee}원 입니다.")
