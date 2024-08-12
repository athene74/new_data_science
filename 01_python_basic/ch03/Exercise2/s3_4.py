while True:
    age = int(input('나이를 입력하세요: '))
    if age<0:
        print('다시 입력하세요')
    else:
        break
charge = 0

if age>=66:
    grade = '노인'
elif age>=19:
    grade = '성인'
    charge = 5000
elif age>=14:
    grade = '청소년'
    charge = 3000
elif age>=4:
    grade = '어린이'
    charge = 2000
else:
    grade = '유아'

if charge == 0:
    print(f'귀하는 {grade}등급이며 요금은 무료입니다.')
    exit()
else:
    print(f'귀하는 {grade}등급이며 요금은 {charge}원입니다.')
    cash = int(input('요금을 입력하세요.'))
        if cash > charge:
            print(f'{cash}원이 모자랍니다. 입력하신 {cash}원을 반환합니다.')
        elif cash == charge:
            print('감사합니다. 티켓을 발행합니다.')
        elif cash < charge:
