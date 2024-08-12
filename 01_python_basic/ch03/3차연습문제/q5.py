payed_count=0
free_ticket_count = 3
discount_ticket_count = 5
while True:
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

    print(f"귀하는 {grade} 등급이며 요금은 {fee}원 입니다.")
    if grade == "유아" or grade == "노인":
        print("무료 입니다. 입장하세요. ")
        continue
    else:
        print(f"{fee}원 입니다.")

    payment_type = int(input("요금 유형을 선택하세요. (1: 현금, 2: 공원 전용 신용 카드): "))

    if payment_type == 1:
        amount = int(input("요금을 입력하세요: "))

        if amount < fee:
            print(f"{fee - amount}가 모자랍니다. 입력하신 {amount}를 반환합니다.")
            continue
        elif amount == fee:
            print("감사합니다. 티켓을 발행합니다.")
        else:
            change = amount - fee
            print(f"감사합니다. 티켓을 발행하고 거스름돈 {change}원을 반환합니다.")
    elif payment_type == 2:
        discount = 0
        if age >= 60 and age <= 65:
            discount += 5
        discounted_fee = fee - (fee * (discount / 100))
        print(f"{int(discounted_fee)}원 결제되었습니다. 티켓을 발행합니다.")
    else:
        print("올바른 요금 유형을 선택해주세요.")
        continue
    payed_count += 1

    if (payed_count % 7 == 0) and free_ticket_count > 0:
        free_ticket_count -= 1
        print(f"축하합니다. 1주년 이벤트에 당첨되었습니다. 여기 무료 티켓을 발행합니다. 잔여 무료 티켓 {free_ticket_count}장")

    if (payed_count % 4 == 0) and discount_ticket_count > 0:
        discount_ticket_count -= 1
        print(f"축하합니다. 연간회원권 구매 이벤트에 당첨되셨습니다. 연간 회원 할인 티켓을 발행합니다. 잔여 할인 티켓 {discount_ticket_count}장")
