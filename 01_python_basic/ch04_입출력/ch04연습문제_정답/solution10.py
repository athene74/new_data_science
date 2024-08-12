menu = {'자장면': 4000, '짬뽕': 5000, '볶음밥': 5500, '탕수육': 8000}

def sum(num1, num2):
    return num1+num2
def show_menu():
    print("=== 메뉴 목록 ===")
    for item, price in menu.items():
        print(f"{item}: {price}원")
    print()

def add_menu():
    item = input("추가할 메뉴를 입력하세요: ")
    if item in menu:
        print("이미 존재하는 메뉴입니다.")
    else:
        price = int(input("메뉴의 가격을 입력하세요: "))
        menu[item] = price
        print(f"{item}이(가) 메뉴에 추가되었습니다.")

def update_menu():
    item = input("수정할 메뉴를 입력하세요: ")
    if item in menu:
        price = int(input("새로운 가격을 입력하세요: "))
        menu[item] = price
        print(f"{item}의 가격이 업데이트되었습니다.")
    else:
        print("해당 메뉴가 존재하지 않습니다.")

def delete_menu():
    item = input("삭제할 메뉴를 입력하세요: ")
    if item in menu:
        del menu[item]
        print(f"{item}이(가) 메뉴에서 삭제되었습니다.")
    else:
        print("해당 메뉴가 존재하지 않습니다.")

while True:
    print("=== 메뉴 관리 프로그램 ===")
    print("1. 메뉴 조회")
    print("2. 메뉴 추가")
    print("3. 메뉴 수정")
    print("4. 메뉴 삭제")
    print("5. 종료")
    choice = input("원하는 작업을 선택하세요: ")

    if choice == '1':
        show_menu()
    elif choice == '2':
        add_menu()
    elif choice == '3':
        update_menu()
    elif choice == '4':
        delete_menu()
    elif choice == '5':
        print("프로그램을 종료합니다.")
        break
    else:
        print("올바른 선택을 입력하세요.\n")


