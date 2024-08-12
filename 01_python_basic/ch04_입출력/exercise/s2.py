def average(num_list):
    total = 0
    for num in range(num_list):
        total += int(num)
    return total/len(num_list)

num_list = input("원하는 만큼 숫자를 입력하여 주세요. 예) 10 20 30 40 50 ").split()
average = average(num_list)
print(average)
