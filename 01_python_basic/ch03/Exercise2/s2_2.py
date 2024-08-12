# While문을 사용해 1부터 1000까지의 자연수 중 3의 배수의 합을 구해 보자

sum = 0
i=0
while i<1000:
    i = i + 1
    # print(i)
    if i% 3 ==0:
        sum = sum +i
        # print(sum)
print(f'{sum} 출력')

