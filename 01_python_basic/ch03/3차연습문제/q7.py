width_prompt = "대각선 가로축의 길이를 홀수로 입력하세요: "
width = int(input(width_prompt))

if width % 2 == 0:
    print("가로축의 길이는 홀수여야 합니다.")
else:
    for i in range(width):
        blank_count = abs(width // 2 - i)
        star_count = width - 2 * blank_count
        print(" " * blank_count + "*" * star_count)