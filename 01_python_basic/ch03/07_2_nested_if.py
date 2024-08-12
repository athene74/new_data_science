age = int(input("나이를 입력하세요: "))
is_student = input("학생입니까? (예/아니오): ")

if age < 18:
    if is_student == "예":
        print("학생 할인 적용됩니다.")
    else:
        print("일반 할인 적용됩니다.")
else:
    if is_student == "예":
        print("학생 할인 적용됩니다.")
    else:
        print("할인이 적용되지 않습니다.")