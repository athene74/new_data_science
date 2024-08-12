# 문제
# 10 미만의 자연수에서 3과 5의 배수를 구하면 3, 5, 6, 9이다. 이들의 총합은 23이다.
# 1,000 미만의 자연수에서 3의 배수와 5의 배수의 총합을 구하라.

# 입력: 1~99
# 출력: 3의 배수와 5의 배수의 총합

# Step1] 1~999 까지의 순회하는 프로그램

# n=1
# while n<1000:
#     print(n)
#     n += 1
# for n in range(1,1000) :
#     print(n)

# Step2] N의 배수 찾기
for n in range(1,1000):
    # if n % 3 == 0: # 3의 배수
    if n % 5 == 0: # 5의 배수
        print(n)

# Step3] 3과 5의 배수 찾기
for n in range(1,1000):
    if n % 3 == 0: # 3의 배수
        print(n)
    if n % 5 == 0: # 5의 배수
        print(n)

# Step5] 3과 5의 배수 값 누적

sum = 0
START =1
END = 999
for n in range(START, END+1):
    if n % 3 == 0: # 3의 배수
        print(n)
        sum += n
    if n % 5 == 0: # 5의 배수
        print(n)
        sum += n

print(f'{START}에서 {END}까지 3과 5의 배수의 총합: {sum}')

# Step6] 검증값 확인 및 최종 오류 수정

sum = 0
START =1
END = 999
for n in range(START, END+1):
    if n % 3 == 0 or n % 5 == 0:
        print(n)
        sum += n

print(f'{START}에서 {END}까지 3과 5의 배수의 총합: {sum}')