age = int(input("나이를 입력하세요: "))

if age >= 0 and age <= 3: # 0 <= age <=3
    fee = "무료"
elif age >= 4 and age <= 13:
    fee = 2000
elif age >= 14 and age <= 18:
    fee = 3000
elif age >= 19 and age <= 65:
    fee = 5000
else:
    fee = "무료"

if fee == "무료":
    print("요금은 무료입니다.")
else:
    print(f"요금은 {fee}원 입니다.")
