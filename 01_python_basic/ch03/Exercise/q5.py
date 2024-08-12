score = int(input('점수를 입력하세요: '))

# step1] 입문자라면 기능 구현 우선으로.

if score>=90:
    print('학점은 A입니다.')
elif score >= 80:
    print('학점은 B입니다.')
elif score >= 70:
    print('학점은 C입니다.')
elif score >= 60:
    print('학점은 D입니다.')
else:
    print('학점은 F입니다.')

# step2]

if score>=90:
    grade ='A'
elif score >= 80:
    grade = 'B'
elif score >= 70:
    grade = 'C'
elif score >= 60:
    grade = 'D'
else:
    grade = 'F'

print(f'학점은 {grade}입니다.')
