# 밑변의 길이를 홀수로 입력받아서 아래와 같이 출력하는 프로그램을 작성하시오
while True:
    input_odd = int(input('홀수를 입력하세요(0 <- 종료): '))

    if not input_odd:
        print('마름모 프로그램 출력을 이용해 주셔서 감사합니다.')
        break

    mid = int(input_odd/2)+1

    for i in range(0, mid):
        for j in range(0,input_odd):
            if j >= mid-1-i and j <= mid -1 +i:
                print('*', end='')
            else:
                print(' ', end='')
        print('')