height = int(input('삼각형 높이를 입력하세요:'))

for star_count in range(1, height+1):
    blank_count = height - star_count
    print((' '* blank_count) * ('*' * star_count))


# 정렬 활용
input_number = int(input('삼각형의 높이를 입력하세요: '))
number = 0
for line in range(input_number):
    number +=1
    print(f'{"*"* number:>{input_number}}', end = '')
    print('')