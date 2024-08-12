# 4.	삼각형 출력 문제 ver2
#     *
#    **
#   ***
#  ****
# *****
HEIGHT = 5

for star_count in range(1, HEIGHT+1):
    blank_count = HEIGHT - star_count
    print((' '*blank_count)*('*'* star_count))

# 포맷 스트링을 활용해 문제 해결
number = 0
for line in range(5):
    number +=1
    print("{0:>5}".format('*'*number) ,end='')
    print('')