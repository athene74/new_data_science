import threading
import time

print('< 데이터 수집기 시뮬레이션 프로그램 ver1.0>')

def scheduler_a():
    print('\n')
    i = 1
    while True:
        print("\t\t\t\t\tAAA 데이터 데이터 수집:%s" % i) # 데이터 수집작업
        i += 1
        time.sleep(1) # 수집주기 1초 => 수집주기마다 데이터 수집을 하는 스케줄링 작업을 수행한다.
def scheduler_b():
    print()
    i = 1
    while True:
        print("\t\t\t\t\t\t\t\t\t\t\t\tBBB 데이터 데이터 수집:%s" % i)
        i += 1
        time.sleep(1)

def print_main_menu():
    print('\n1. AAA 실시간 데이터 구축')
    print('2. BBB 실시간 데이터 구축')
    print('3. CCC 실시간 데이터 구축')
    print('4. 스케줄러 종료')
    print('* 엔터: 메뉴 업데이트\n')

while True:
    print_main_menu()
    print('아래행에 메뉴입력: ', end='')
    selection = input()
    if selection == '':  continue
    else:                menu_num = int(selection)

    if(menu_num == 1):
        t = threading.Thread(target=scheduler_a, daemon=True)
        t.start()
    elif(menu_num == 2):
        t = threading.Thread(target=scheduler_b, daemon=True)
        t.start()
    elif(menu_num == 3):
        pass
    elif(menu_num == 4):
        break
    elif (menu_num == 0):
        continue
