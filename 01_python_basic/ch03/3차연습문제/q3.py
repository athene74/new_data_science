age = int(input("나이를 입력하세요: "))

if age >= 0 and age <= 3:
    grade = "유아"
    fee = 0
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
    fee = 0

print(f"귀하는 {grade} 등급이며 요금은 ",end='')
if grade == "유아" or grade=="노인":
    print("무료 입니다. 티켓을 발행합니다.")
    exit()
else:
    print(f"{fee}원 입니다.")

amount = int(input("요금을 입력하세요: "))

if amount < fee:
    print(f"{fee - amount}가 모자랍니다. 입력하신 {amount}를 반환합니다.")
elif amount == fee:
    print("감사합니다. 티켓을 발행합니다.")
else:
    change = amount - fee
    print(f"감사합니다. 티켓을 발행하고 거스름돈 {change}원을 반환합니다.")
