import time
import threading # threading 스레드를 생성하기 위한 모듈

def infinite_loop():
    while True:
        time.sleep(1)
        print(('\t'*10)  + '쓰레드 무한루프 실행 중...')

# daemon: True => 부모 프로그램이 종료시 해당 쓰레드는 같이 종료된다.
t = threading.Thread(target=infinite_loop, daemon=True)
t.start()

print('메인 프로그램 시작')
print('메인 프로그램 5초간 Sleeping..')
time.sleep(5)
print('메인 프로그램 종료')