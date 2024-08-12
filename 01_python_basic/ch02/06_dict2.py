a={1:'a'}

print(a)
# 아래가 리스트라면 인덱스 2의 요소의 값을 'b'로 변경하라는 의미이지만
# dict 타입에서는
# 2라는 키가 있다면 해당 값을 'b'로 변경
# 2라는 키가 없다면 key 2, value 'b'로 해당 요소를 추가한다.
a[2]='b'
print(a)

# 2라는 키가 있으므로 해당 값을 'b'로 변경
a[2]='c'
print(a)

a['name'] = 'pey'
print(a)

del a[1]
print(a)