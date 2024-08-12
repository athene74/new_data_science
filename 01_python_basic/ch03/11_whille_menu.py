prompt = """
1. Add
2. Del
3. List
4. Quit

Enter number: """

number = 0

# while True 종료 조건은 break 처리하는 것은
# 반복문 조건이 복잡하거나 추후에 고려하고자 할 때 적용되는
# 일반적인 패턴
while True:
    # end의 기본값은 \n이다. 하지만 '' 재정의하면
    # 줄바꿈을 하지 않는다.
    print(prompt,end='')
    number = int(input())

    if number == 4:
        break   # break가 실행되면 해당 반복문을 빠져나온다.
