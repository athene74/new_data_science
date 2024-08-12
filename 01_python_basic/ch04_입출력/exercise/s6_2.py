def calc_onebox_price(total_price):
    onebox_price = total_price //10
    print(f'한 상자의 금액은 {onebox_price}입니다.')


price=int(input('10 상자 총지불금액을 입력하여 주세요 : '))
calc_onebox_price(price)
