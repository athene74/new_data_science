def say_myself(name='김시현', age=30, man=True):
    print("나의 이름은 %s 입니다." % name)
    print("나이는 %d살입니다." % age)
    if man:
        print("남자입니다.")
    else:
        print("여자입니다.")

say_myself('이지우', 27, False)
say_myself('이지우', 27)
say_myself('이지우')
say_myself()