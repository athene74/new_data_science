# coffee.py
# coffee_remained: 커피 잔량수
# 변수(Variable): 바뀔수 있는값 (예: 사용자가 입력한 돈)
# 상수(Constant): 바뀌지 않는값 (예: 원주율, 3.141592, 커피 판매가격)
# 파이썬에서는 상수 관련 타입이 존재 하지 X,
# 하지만 변수명을 대문자로 표기해서 상수임을 나타냄

coffee_remained = 10
COFFEE_PRICE = 300
while True:
    money = int(input("돈을 넣어 주세요: "))
    if money == COFFEE_PRICE: # 300 => 커피가격 300원
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



# money = True
# if money:
#     print("택시를 타고 가라")
# else:
#     print("걸어가라")


# # 구구단
# for i in range(2,10):
#     for j in range(1,10):
#         print(f'{i}*{j}={i*j}', end='\t')
#     print('')
# print("가로로 1줄씩 2단, 3단, ..., 9단 구구단 출력입니다.")
# for i in range(1,10):
#     for j in range(2,10):
#         print(f'{j}*{i}={j*i}', end='\t')
#     print('')
# print("세로로 1단락씩 2단, 3단, ..., 9단 구구단 출력입니다.")