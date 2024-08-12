age = int(input('나이를 입력하세요: '))
fee = 0
if age>=66:
    pass
elif age>=19:
    fee= 5000
elif age>=14:
    fee=3000
elif age>=4:
    fee = 2000
else:
    pass

if fee == 0:
    print(f'요금은 무료입니다.')
else:
    print(f'요금은 {fee}원입니다.')