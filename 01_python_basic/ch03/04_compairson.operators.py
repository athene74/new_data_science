# x = 1
# y = 2
#
# if x == y:
#     print("x와 y는 같습니다.")
# else:
#     print("x와 y는 다릅니다.")

money = 2000
card = True

if money >= 3000 or card:
    print("택시를 타고 가라")
else:
    print("걸어가라")

is_money = False

# 조건의 결과를 뒤집도 싶을 때 사용하는 연산자
# 돈이 없으면 (False)일 때 실행문을 수행하고 싶을 때
if not is_money:
    print("급식소에 가세요.")