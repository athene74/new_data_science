items = [
    "티셔츠",
    "청바지",
    "운동화",
    "자켓",
    "선글라스",
    "백팩",
    "시계",
    "모자",
    "벨트",
    "스카프",
    "장갑",
    "스웨터",
    "드레스",
    "치마",
    "부츠",
    "샌들",
    "지갑",
    "팔찌",
    "목걸이",
    "귀걸이"
]

search_item = "치마"
# if search_item in items:
#     print(f"{search_item} 재고 확인")
# else:
#     print(f"{search_item} 재고 미확인")

if search_item not in items:
    print(f"{search_item} 재고 미확인")
else:
    print(f"{search_item} 재고 확인")

print("전체재고 목록")
print(items)
