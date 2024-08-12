while True:
    age = int(input('나이를 입력하세요: '))
    if age < 0:
        print('다시 입력하세요')
    else:
        break

if age >= 66:
    grade = '노인'
    fee = 0
elif age >= 19:
    grade = '성인'
    fee = 5000
elif age >= 14:
    grade = '청소년'
    fee = 3000
elif age >= 4:
    grade = '어린이'
    fee = 2000
else:
    grade = '유아'
    fee = 0

if fee == 0:
    print(f'귀하는 {grade}등급이며 요금은 무료입니다.')
    exit()
else:
    print(f'귀하는 {grade}등급이며 요금은 {fee}원입니다.')
    payment_type = int(input('요금 유형을 선택하세요.(1:현금, 2:공원 전용 신용카드'))
    if payment_type == 1:
        amount= int(input('요금을 입력하세요.'))
        if  amount < fee:
            print(f'{fee-amount}원이 모자랍니다. 입력하신 {amount}원을 반환합니다.')
        elif amount == fee:
            print('감사합니다. 티켓을 발행합니다.')
        else:
            change = amount -fee
            print(f'감사합니다. 티켓을 발행하고 거스름돈 {chage}원을 반환합니다')
    elif payment_type == 2:
        discount = 0
        if age >= 60 and age <= 65:
            discount += 5
        discounted_fee = fee

