# for문은 데이터를 접근하기 위한 용도로 작성되었다.
# for문에서 사용되는 열거형 데이터의 작명은
# 열거형 데이터의 성격, 의미가 무엇인지 파악한다.
# 데이터의 의미에 따라 작명을 하고
# 아래와 같이 데이터의 의미_list, 데이터s 등의 패턴으로
# 작명한다.
number_list = ['one', 'two', 'three']
# numbers = ['one', 'two', 'three']
# for문 작성시 for문에서 열거형 데이터는 받는
# 변수의 작명은 해당 열거형 데이터 의미의 단수형으로
# 작명을 한다.
for number in number_list:
    print(number)
