# input([프롬프트메세지])
# input으로 받는 값의 타입은 문자열이다.

number = input('숫자를 입력하세요: ')
print(f'당신이 입력한 숫자는 {number}입니다.')
print(type(number))

# print(f'당신이 입력한 숫자에 10을 더한 수는 {number+10}입니다.')
print(f'당신이 입력한 숫자에 10을 더한 수는 {int(number)+10}입니다.')