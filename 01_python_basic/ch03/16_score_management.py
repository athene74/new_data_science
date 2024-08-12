# marks1.py
# marks = [90, 25, 67, 45, 80]   # 학생들의 시험 점수 리스트
#

number = 0   # 학생에게 붙여 줄 번호
# for mark in marks:
#     number = number +1
#     if mark >= 60:
#         print("%d번 학생은 합격입니다." % number)
#     else:
#         print("%d번 학생은 불합격입니다." % number)

score_list = [90, 25, 67, 45, 80]
for score in score_list: # 90, 25, 67, 45, 80을 순서대로 score에 대입
    number = number + 1
    if score >= 60:
        result = '합격'
    else:
        result = '불합격'

    print(f"{number}번 학생은 {result}입니다.")
