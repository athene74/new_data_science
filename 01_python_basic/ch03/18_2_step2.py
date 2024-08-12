# 2단 출력
"""
print(2*1, end='')
print(' ', end='')
print(2*2, end='')
print(' ', end='')
print(2*3, end='')
print(' ', end='')
print(2*4, end='')
print(' ', end='')
print(2*5, end='')
print(' ', end='')
print(2*6, end='')
print(' ', end='')
print(2*7, end='')
print(' ', end='')
print(2*8, end='')
print(' ', end='')
print(2*9, end='')
print(' ', end='')
"""
TWO_TIMES = 2
for multiplier_table in range(1,10):
    # 반복되는 실행문을 넣고
    # 변경되는 항목만 for문에서 변수처리하여 사용한다.
    print(TWO_TIMES * multiplier_table, end='')
    print(' ', end='')