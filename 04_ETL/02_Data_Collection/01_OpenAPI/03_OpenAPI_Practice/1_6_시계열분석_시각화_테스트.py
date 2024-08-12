# 목적: 파이썬 코드를 활용하여 OpenAPI 호출 자동화
# Step1: OpenAPI를 제공하는 사이트에서 제공하는 샘플 프로그램을 확보한다.

# 검증된 URL
# http://openapi.tour.go.kr/openapi/service/EdrcntTourismStatsService/getEdrcntTourismStatsList?serviceKey=VNH7QeBnhzad%2B45QS4DMbIvJp0s%2Fx2iY9vdKxLYJJJEHMFFHDLr8HZJHuPgfjWRTg22OklmBOuSWznNeJktguQ%3D%3D&_type=json&YM=202402&NAT_CD=100&ED_CD=D

#파라메터 세팅
# params ={키1:값1, .... , 키N:값N  }
#
# response = requests.get(url, params=params)
# print(response.content)
import requests
import json
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import font_manager, rc

# 한글 폰트 설정
font_location = "C:\Windows\Fonts\malgun.ttf"
font_name = font_manager.FontProperties(fname=font_location).get_name()
rc('font', family=font_name)
plt.rcParams['axes.unicode_minus'] = False

# access_key ='Yff2okQ2i8jEUaDanPqgbSuRzoFOaP0AfYzU7Mkhe4QP9tapdiZiOvmhk%2BZeOrBMrxJqbxU6M58b1OeuM%2FOKsg%3D%3D'
access_key = 'Yff2okQ2i8jEUaDanPqgbSuRzoFOaP0AfYzU7Mkhe4QP9tapdiZiOvmhk+ZeOrBMrxJqbxU6M58b1OeuM/OKsg=='



def get_request_url(year_start, year_end, month_end):
    url = 'http://openapi.tour.go.kr/openapi/service/EdrcntTourismStatsService/getEdrcntTourismStatsList'

    data = []

    for year in range(year_start, year_end + 1): # range 객체의 두번째 인자 값은 포함하지 않기 때문에 1을 더해줌
        # 이 프로그램은 year_stat 1월 ~ 12월 까지
        # year_end 1월 부터 month_end월까지 자동으로 요청을 만드는 반복문 조건입니다.
        # 만약에 함수 파라메터가 2022, 2023, 5 이렇게 호출될경우
        # 2022년 1월 2022년 12월, 2023년 1월 부터 2023년 5월까지 호출하는 조건이 된다.
        # 그렇게 때문에 마지막 년도를 제외한 월의 조건 12가 되기 위한 3항 연산 조건
        month_end_value = 12 if year < year_end else month_end
        for month in range(1, month_end_value + 1):
            # 6자리 연월을 계산하기 위해
            ym = year * 100 + month # 2023*100=202300, month:5 =>202300+5=202305

            params = {
                'serviceKey': access_key,
                '_type': 'json',
                'YM': ym,
                'NAT_CD': 100,
                'ED_CD': 'D'
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

    df = pd.DataFrame(data, columns=['날짜', '국가', '여행자수'])
    df = df.set_index('날짜')
    return df

df = get_request_url(2023,2024,6)

print(df)

# 그래프 크기 설정
plt.figure(figsize=(10, 6))

# 국가별 선 그래프 그리기
for country in df['국가'].unique():
    country_data = df[df['국가'] == country]
    plt.plot(country_data.index, country_data['여행자수'], label=country)

# 그래프 축 레이블 및 타이틀 설정
plt.xlabel('날짜')
plt.ylabel('여행자수')
plt.title('기간별 대한민국 관광객 여행자수')

# 범례 추가
plt.legend()

# x축 눈금 라벨 회전
plt.xticks(rotation=45)

# 그래프 출력
plt.show()