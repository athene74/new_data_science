import time

tree_hit = 0

while tree_hit <10:
    time.sleep(1)
    tree_hit = tree_hit +1
    print(f"나무를 {tree_hit}번 찍었습니다.")

    if tree_hit == 10:
        print("나무 넘어갑니다.")