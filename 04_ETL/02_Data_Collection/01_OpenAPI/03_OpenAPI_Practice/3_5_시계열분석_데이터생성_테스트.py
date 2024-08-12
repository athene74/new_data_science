# 목적: 파이썬 코드를 활용하여 OpenAPI 호출 자동화
# Step1: OpenAPI를 제공하는 사이트에서 제공하는 샘플 프로그램을 확보한다.

# 검증된 URL
# https://apis.data.go.kr/B551893/fuel-cell-by-hour/list?serviceKey=Yff2okQ2i8jEUaDanPqgbSuRzoFOaP0AfYzU7Mkhe4QP9tapdiZiOvmhk%2BZeOrBMrxJqbxU6M58b1OeuM%2FOKsg%3D%3D&page=1&size=10&startD=20220101&endD=20230101

#파라메터 세팅
# params ={키1:값1, .... , 키N:값N  }
#
# response = requests.get(url, params=params)
# print(response.content)
import requests
import json
import pandas as pd

# access_key ='Yff2okQ2i8jEUaDanPqgbSuRzoFOaP0AfYzU7Mkhe4QP9tapdiZiOvmhk%2BZeOrBMrxJqbxU6M58b1OeuM%2FOKsg%3D%3D'
access_key = 'Yff2okQ2i8jEUaDanPqgbSuRzoFOaP0AfYzU7Mkhe4QP9tapdiZiOvmhk+ZeOrBMrxJqbxU6M58b1OeuM/OKsg=='
def get_request_url(start_day, end_day):
    url = 'http://apis.data.go.kr/B551893/fuel-cell-by-hour/list'

    data = []

    for day in range(start_day, end_day + 1): # range 객체의 두번째 인자 값은 포함하지 않기 때문에 1을 더해줌
        # 이 프로그램은
        # start_day 부터 end_day 까지 자동으로 요청을 만드는 반복문 조건입니다.
        # 만약에 함수 파라메터가 20240601, 20240630 이렇게 호출될경우
        # 2024년 6월 1일부터 2024년 6월 30일까지 호출하는 조건이 된다.
        #

        for month in range(1, month_end_value + 1):
            # 6자리 연월을 계산하기 위해
            # ym = year * 100 + month # 2023*100=202300, month:5 =>202300+5=202305

            params = {
                'serviceKey': access_key,
                'startD': start_day,
                'endD': end_day
            }

            response = requests.get(url, params=params)
            raw_json = response.json()

            if 'items' in raw_json['response']['body']:
                items = raw_json['response']['body']['items']['item']
                data.append([
                        pd.to_datetime(items['ym'], format='%Y%m'),
                        items['natKorNm'],
                        items['num']
                    ])

    df = pd.DataFrame(data, columns=['날짜', '발전소명', '총량'])
    df = df.set_index('날짜')
    return df
# 특정시작년도 부터 특정년도의 특정월까지의 데이터를 수집
df = get_request_url(20240601,20240631)

print(df)
