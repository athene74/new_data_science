import time
import threading # threading 스레드를 생성하기 위한 모듈

def infinite_loop():
    while True:
        time.sleep(1)
        print('무한루프 실행 중...')

t = threading.Thread(target=infinite_loop)
t.start()

print('메인 프로그램 시작')
print('메인 프로그램 종료')