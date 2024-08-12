height_prompt = "높이를 입력하세요: "

height = int(input(height_prompt))

if height <= 0:
    print("높이는 양수여야 합니다.")
else:
    for i in range(height):
        blank_count = height - i - 1
        stars_count = 2 * i + 1
        print(" " * blank_count + "*" * stars_count)
