# a의 초기 값을 1로 설정하게 되면
# 아래와 같이 a가 짝수, 홀수인 모든 상황에
# 값을 증가하는 중복코드를 작성하게 된다.
# a = 1
# while a < 10:
#     if a % 2 == 0:
#         a = a + 1
#         continue
#     print(a)
#     a = a + 1

# 따라서 아래와 같이 작성하는 것이 유지보수성에서 좋다.
a = 0
while a < 10:
    a = a + 1
    if a % 2 == 0:
        continue
    print(a)

