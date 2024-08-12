prompt = """
1. Add
2. Del
3. List
4. Quit

Enter number: """

number = 0

while number != 4:
    # end의 기본값은 \n이다. 하지만 '' 재정의하면
    # 줄바꿈을 하지 않는다.
    print(prompt,end='')
    number = int(input())