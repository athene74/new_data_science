# from faker import Faker
#
# fake = Faker('ko_kr')
# for i in range(10:)
# print((fake.name()

def solution(n):
    even_sum = 0
    for i in range(1,n+1):
        i = i + 1
        if i%2 == 0:
            even_sum += i
    answer = even_sum
    return answer

print(solution(9))