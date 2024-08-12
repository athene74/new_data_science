import time
import threading # threading 스레드를 생성하기 위한 모듈

def long_task(): # 5초의 작업시간이 걸리는 쓰레드 함수
    for i in range(5):
        time.sleep(1) # 1초간 대기한다.
        print(f"작업중.. {i+1}")

print('메인 프로그램 시작')

threads = []
# long_task 작업을 5회 반복해 보자
for i in range(5):
    t = threading.Thread(target=long_task) # 쓰레드는 함수에 수행 로직을 정의한다.
    threads.append(t)
    # long_task()

for t in threads:
    t.start() # 쓰레드객체.start() 해당 쓰레드에 등록된 함수가 비동기방식으로 즉각 병렬로 수행한다.

print('메인 프로그램 종료')