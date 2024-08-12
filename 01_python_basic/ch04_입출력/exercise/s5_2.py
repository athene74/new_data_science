def print_3xn(message):
    for i in range(0, len(message),3):
        print(message[i:i+3])

message = input("메세지를 입력하여 주세요: ")
print_3xn(message)