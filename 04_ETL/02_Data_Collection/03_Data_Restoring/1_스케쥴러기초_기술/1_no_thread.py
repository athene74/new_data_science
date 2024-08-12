import time

def long_task(): # 5초의 작업시간이 걸리는 함수
    for i in range(5):
        time.sleep(1) # 1초간 대기한다.
        print(f"작업중.. {i+1}")

print('프로그램 시작')

# long_task 작업을 5회 반복해 보자
for i in range(5):
    long_task()

print('프로그램 종료')