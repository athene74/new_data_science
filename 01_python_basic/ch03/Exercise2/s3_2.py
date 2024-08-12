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
else:
    print(f'귀하는 {grade}등급이며 요금은 {charge}원입니다.')
