# coffee.py
# coffee_remained: 커피 잔량수
# 변수(variable): 바뀔 수 있는 값 (예: 사용자가 입력한 돈)
# 상수(Constant): 바뀌지 않는 값 (예: 원주율, 3.141592, 커피 판매가격)
# 파이썬에서는 상수 관려 타입이 존재하지 X
# 하지만 변수명을 대문자로 표기해서 상수임을 나타냄

# coffee_remained = 2
coffee_remained = 10
COFFEE_PRICE = 300
while True:
    money = int(input("돈을 넣어 주세요: "))
    if money == COFFEE_PRICE:    # 300 => 커피가격 300원
        print("커피를 줍니다.")
        coffee_remained = coffee_remained - 1
    elif money > COFFEE_PRICE:
        print("거스름돈 %d를 주고 커피를 줍니다." % (money -300))
        coffee_remained = coffee_remained - 1
    else:
        print("돈을 다시 돌려주고 커피를 주지 않습니다.")
        print("남은 커피의 양은 %d개 입니다." % coffee_remained)
    if coffee_remained == 0:
        print("커피가 다 떨어졌습니다. 판매를 중지 합니다.")
        break
